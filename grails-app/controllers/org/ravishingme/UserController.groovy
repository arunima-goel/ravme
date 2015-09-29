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

			if (facebookAccessToken) {
				def data = userService.createUser(facebookAccessToken)
				render data
			} else {
				flash.error = "Token not found."
				Map data = [response: "false"]
				render data
			}
			
		} catch (CustomException ce) {
			Map data = [response: "error"]
			render data
		}


	}

	def loginError() {
		render params
	}
}
