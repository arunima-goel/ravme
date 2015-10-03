package org.ravishingme

import grails.converters.JSON
import org.scribe.model.Token

class ProfileController {
	def oauthService
	def userService

	def index(String username) {
		log.info("Getting profile for user: " + username)
		try {
			def profile = Profile.findByUsername(username)
			if (profile) {
				checkMinContent(username)
				[profile:profile]
			} else {
				redirect(uri: "/")
			}
			
		} catch (Exception e) {
			flash.error = "Exception during profile index"
		}


	}

	def edit(String username) {
		log.info("Edit profile for user: " + username)
		Token facebookAccessToken = (Token) session[oauthService.findSessionKeyForAccessToken('facebook')]
		try {
			def facebookResource = oauthService.getFacebookResource(facebookAccessToken, "https://graph.facebook.com/me")
			def facebookResponse = JSON.parse(facebookResource?.getBody())

			def profile = Profile.findByUsername(username);
			[profile:profile]
		} catch (Exception e) {
			flash.error = "Exception during profile edit"
		}
	}


	def minContentExists(String username) {
		log.info("Minimum content exists for the user: " + username);
		return true;
	}
	
	def checkMinContent(String username) {
//		Token facebookAccessToken = (Token) session[oauthService.findSessionKeyForAccessToken('facebook')]
//		def facebookResource = oauthService.getFacebookResource(facebookAccessToken, "https://graph.facebook.com/me")
//		def facebookResponse = JSON.parse(facebookResource?.getBody())
//
//		def user = User.findByUserid(facebookResponse.id)
//		if (!minContentExists(username) &&  user && user.getUsername() == username) {
//			flash.error = "Your profile is incomplete and will not be displayed in the search results. " 
//			+ "Please update your profile."
//		}
	}

	def loginError() {
		render params
	}
}
