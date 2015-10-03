package org.ravishingme

import grails.converters.JSON
import org.scribe.model.Token

class UserController {
	def oauthService
	def userService
	def index() {}

	def loginSuccess() {
		log.info("Successful facebook login");
		Token facebookAccessToken = (Token) session[oauthService.findSessionKeyForAccessToken('facebook')]
		try {
			def facebookResource = oauthService.getFacebookResource(facebookAccessToken, "https://graph.facebook.com/me")
			def facebookResponse = JSON.parse(facebookResource?.getBody())
	
			if (facebookAccessToken) {
				def userid = facebookResponse.id
				if (!User.findByUserid(userid)) {
					userService.createUser(facebookResponse.name, userid)
				}
				User user = User.findByUserid(userid)
				log.info("Logged in user: " + user.getUsername())
				redirect(controller: "profile", action: "index", params:[username:user.getUsername()])
			} else {
				flash.error = "Token not found."
			}
			
		} catch (CustomException ce) {
			flash.error = "Exception during login"
		}


	}

	def loginError() {
		flash.error = "Error."
        render view: '/index'
	}
	
	def logout() {
		if (params.id && session[oauthService.findSessionKeyForAccessToken(params.id)]) {
			session[oauthService.findSessionKeyForAccessToken(params.id)] = null
			flash.message = "Token revoked successfully."
		}
		redirect action: 'index'
	}
}
