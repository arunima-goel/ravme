package org.ravishingme

import grails.converters.JSON

import org.scribe.model.Token

class ProfileController {
	def oauthService
	def userService
	def facebookService
	
	def index(String username) {
		log.info("Getting profile: " + username)
		try {
			def profile = Profile.findByUsername(username)
			if (profile) {
				checkMinContent(username) // if logged in user is the same as the username, 
										  // then check min content and display edit page
				def user = getLoggedInUser()
				[profile:profile]
			} else {
				redirect(uri: "/")
			}
			
		} catch (Exception e) {
			flash.error = "Exception during profile index"
		}


	}

	def getLoggedInUser() {
		log.info("Getting logged in user")
		Token facebookAccessToken = (Token) session[oauthService.findSessionKeyForAccessToken('facebook')]
		try {
			// Get user id and username from facebook
			def (userid, name) = facebookService.getUserIdAndName(facebookAccessToken, "me")
			log.info("Got logged in user")
			log.info("userId: " + userid + " name: " + name)
			return User.findByUserid(userid)
		} catch (CustomException ce) {
			log.info("Error getting logged in user")
			flash.error = "Exception during login"
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
		profileInstance.properties = params
		log.info("Profile instance modes of payment: " + profileInstance.modesOfPayment)
		profileInstance.save(flush: true)
		redirect(action: "edit", params:[name: profileInstance.username])
		
	}
	
	def addService() {
		log.info("Adding service")
		def serviceInstance = new Service()
		serviceInstance.properties = params
		
		def profileInstance = Profile.get(params.id)
		profileInstance.addToServices(serviceInstance)
		profileInstance.save(flush: true)
		redirect(action: "edit", params:[name: profileInstance.getUsername()])
	}
	
	def addFavorite() {
		log.info("Adding favorite")
		def favoriteProfileInstance = Profile.get(params.id)
		
		def profileInstance = getLoggedInUser().profile
		profileInstance.addToFavorites(favoriteProfileInstance)
		profileInstance.save(flush: true)
		redirect(action: "index", params:[username: profileInstance.getUsername()])
	}
	
	def removeFavorite() {
		log.info("Removing favorite")
		log.info("\nFavorite Id: " + params.favoriteId + "\nId: " + params.id)
		def favoriteProfileInstance = Profile.get(params.favoriteId)
		
		def profileInstance = Profile.get(params.id)
		profileInstance.removeFromFavorites(favoriteProfileInstance)
		profileInstance.save(flush: true)
//		redirect(action: "index", params:[username: profileInstance.getUsername()])
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
