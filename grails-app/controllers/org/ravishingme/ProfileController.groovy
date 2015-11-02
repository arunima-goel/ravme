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
				[profile:profile, profilePic: getProfilePic(username)]
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
			[profile:profile, profilePic: getProfilePic(profile.username)]
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
		profileInstance.cosmeticBrands.clear() // ***deselected values don't get saved if we don't clear the values here 
		profileInstance.specialities.clear()
		bindData profileInstance, params
		//profileInstance.properties = params
		log.info("services " + params)
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
		//redirect(action: "edit", params:[name: profileInstance.getUsername()])
		render(template:'/profile/service', collection: Profile.get(params.id).services)
	}
	
	def search() {
		log.info("Search params: " + params)
		render(template:'/profile/searchResults', collection: Profile.list())
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
		redirect(action: "index", params:[username: profileInstance.getUsername()])
	}

	def minContentExists(String name) {
		log.info("Minimum content exists for the profile: " + name);
		return false;
	}

	def getProfilePic(String username) {
		User user = User.findByUsername(username)
		Token facebookAccessToken = (Token) session[oauthService.findSessionKeyForAccessToken('facebook')]
		try {
			def (profilePicUrl) = facebookService.getProfileImage(facebookAccessToken, user.userid)
			return g.img(uri: profilePicUrl)

		} catch (CustomException ce) {
			log.error(ce.errorMessage)
		}
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


	def uploadProfilePic() {
		// Get the avatar file from the multi-part request
		def f = request.getFile('avatar')

		def profile = Profile.findByUsername("Amit-Rao")
		// Save the image and mime type
		Image profilePic = new Image(f.bytes, f.contentType)
		profile.profilePic = profilePic
		profile.coverPic = profilePic

		log.info("File uploaded: $profile.profilePic.imageType")

		// Validation works, will check if the image is too big
		if (!profile.save(flush: true)) {
			return
		}
	}

	def addPortfolioPicsToAlbum() {
		// TODO: add album name here
		String albumName = "MakeUp"
		List fileList = request.getFiles('files') // 'files' is the name of the input
		def profile = Profile.findByUsername("Amit-Rao")
		def album = profile.albums.findAll{ it.albumName == albumName}

		if (album) {
			log.info("found album")
			album = Album.findById(album.id)
			//			  album.addToImages(new Image(file.bytes, f.contentType))
		} else {
			log.info("creating new album")
			album = new Album(albumName)
			profile.addToAlbums(album)
			profile.save(flush: true)
		}

		fileList.each { file ->
			println 'filename: ' + file.getOriginalFilename()
			// Save the image and mime type
			log.info("File bytes: " + file.bytes + "contenttype: " + file.contentType)
			Image portfolioPic = new Image(file.bytes, file.contentType)
			album.addToImages(portfolioPic)
		}

		album.save(flush:true)
	}
	
	def profilePic() {
		log.info("get profile pic")
		def avatarUser = Profile.findByUsername("Amit-Rao")
		response.contentType = avatarUser.profilePic.imageType
		response.contentLength = avatarUser.profilePic.image.size()
		log.info("Profile pic type: " + avatarUser.profilePic.imageType)
		log.info("Profile pic: " + avatarUser.profilePic.image)
		OutputStream out = response.outputStream
		out.write(avatarUser.profilePic.image)
		out.close()
	}

	def coverPic() {
		log.info("get cover pic")
		def avatarUser = Profile.findByUsername("Amit-Rao")
		response.contentType = avatarUser.coverPic.imageType
		response.contentLength = avatarUser.coverPic.image.size()
		log.info("Cover pic type: " + avatarUser.coverPic.imageType)
		log.info("Cover pic: " + avatarUser.coverPic.image)
		OutputStream out = response.outputStream
		out.write(avatarUser.coverPic.image)
		out.close()
	}


}
