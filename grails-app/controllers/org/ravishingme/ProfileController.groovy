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
				checkMinContent(username)
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
		def profile = new Profile(params)

		log.info("ID: " + params.id + " username: " + params.username)
		log.info("Saved profile for user: " + profile.getName2())
		redirect(action:"edit", params:[name: profile.getName2()])
		
		def personInstance = Person.get(id)
		
	}

	def save2() {
		log.info("Saving profile")
		log.info("\nID: " + params.id + 
			"\nprofile username: " + params.username +
			"\nabout you: " + params.aboutYou)
		
		def profileInstance = Profile.get(params.id)
		def user = User.findByUsername(profileInstance.username)
		profileInstance.properties = params
		profileInstance.save(flush: true)
		
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
