package org.ravishingme

import grails.converters.JSON
import org.scribe.model.Token

class UserController {
	def oauthService
	def userService
	def facebookService
	
	def index() {
	}

	def loginSuccess() {
		log.info("Successful facebook login");
		Token facebookAccessToken = (Token) session[oauthService.findSessionKeyForAccessToken('facebook')]
		try {
			// Get user id and username from facebook
			def (userid, name) = facebookService.getUserIdAndName(facebookAccessToken, "me")
			log.info("userId: " + userid + " name: " + name)
			
			// Create the user in our database
			if (!User.findByUserid(userid)) {
				userService.createUser(name, userid)
			}
			
			// Get the user and redirect to the profile of the user
			User user = User.findByUserid(userid)
			
			log.info("forward uri: " + request.forwardURI
				 + " request url: " + request.getRequestURL()
				 + " params: " + params)
			redirect(controller: "profile", action: "index", params:[username: user.profile.getUsername()])
		} catch (CustomException ce) {
			flash.error = "Exception during login"
		}
	}
	
	def printLoggedInUser() {
		log.info("Getting logged in user")
		Token facebookAccessToken = (Token) session[oauthService.findSessionKeyForAccessToken('facebook')]
		try {
			// Get user id and username from facebook
			def (userid, name) = facebookService.getUserIdAndName(facebookAccessToken, "me")
			log.info("userId: " + userid + " name: " + name)
		} catch (CustomException ce) {
			flash.error = "Exception during login"
		}
	}

	def loginError() {
		flash.error = "Error."
        render view: '/index'
	}
	
	def logout() {
		log.info("logging out")
		if (params.id && session[oauthService.findSessionKeyForAccessToken(params.id)]) {
			session[oauthService.findSessionKeyForAccessToken(params.id)] = null
			flash.message = "Token revoked successfully."
			log.info("token revoked successfully")
		}
				redirect(uri: "/")
	}
}
