package org.ravishingme

import grails.converters.JSON

import org.scribe.model.Token

class ProfileController {
	def oauthService
	def userService

	def index(String username) {
		log.info("Getting profile: " + username)
		try {
			def profile = Profile.findByUsername(username)
			if (profile) {
				checkMinContent(username) // if logged in user is the same as the username, 
										  // then check min content and display edit page
				[profile:profile]
			} else {
				redirect(uri: "/")
			}
			
		} catch (Exception e) {
			flash.error = "Exception during profile index"
		}


	}

	def edit(String name) {
		log.info("Edit profile: " + name)
		Token facebookAccessToken = (Token) session[oauthService.findSessionKeyForAccessToken('facebook')]
		try {
			def facebookResource = oauthService.getFacebookResource(facebookAccessToken, "https://graph.facebook.com/me")
			def facebookResponse = JSON.parse(facebookResource?.getBody())

			def profile = Profile.findByUsername(name);
			[profile:profile]
		} catch (Exception e) {
			flash.error = "Exception during profile edit"
		}
	}
	
	def save() {
		log.info("Saving profile")
		log.info("\nID: " + params.id + 
			"\nprofile username: " + params.username +
			"\nmodes of payment: " + params.modesOfPayment)
		
		def profileInstance = Profile.get(params.id)
		def user = User.findByUsername(profileInstance.username)
		profileInstance.properties = params
		log.info("Profile instance modes of payment: " + profileInstance.modesOfPayment)
		profileInstance.save(flush: true)
		redirect(action: "edit", params:[name: profileInstance.username])
		
	}

	def minContentExists(String name) {
		log.info("Minimum content exists for the profile: " + name);
		return false;
	}
	
	def checkMinContent(String name) {
//		Token facebookAccessToken = (Token) session[oauthService.findSessionKeyForAccessToken('facebook')]
//		def facebookResource = oauthService.getFacebookResource(facebookAccessToken, "https://graph.facebook.com/me")
//		def facebookResponse = JSON.parse(facebookResource?.getBody())
//
//		def user = User.findByUserid(facebookResponse.id)
//		if (!minContentExists(name) &&  user && user.getUserName() == name) {
//			flash.error = "Your profile is incomplete and will not be displayed in the search results. " 
//			+ "Please update your profile."
//		}
	}

	def loginError() {
		render params
	}
}
