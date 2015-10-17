package org.ravishingme

import org.scribe.model.Token;

import grails.converters.JSON

class FacebookService {
	def oauthService

	def getProfileImage(Token facebookAccessToken, String userId) {
		if (!facebookAccessToken) {
			throw new CustomException('Token not found.')
		}

		if (!userId) {
			throw new CustomException("UserId not found.")
		}

		String url = "https://graph.facebook.com/${userId}/picture?type=large&redirect=false"
		def facebookResource = oauthService.getFacebookResource(facebookAccessToken, url)
		def facebookResponse = JSON.parse(facebookResource?.getBody())
		String fbProfilePicUrl = facebookResponse.data?.url

		if (!fbProfilePicUrl) {
			log.info("FB Profile Image - ${facebookResource}")
			throw new CustomException("Profile image not found.")
		}

		return [fbProfilePicUrl, facebookResponse]
	}

	def getUserIdAndName(Token facebookAccessToken, String userId) {
		if (!facebookAccessToken) {
			throw new CustomException('Token not found.')
		}

		if (!userId) {
			throw new CustomException('UserId not found.')
		}

		String url = "https://graph.facebook.com/${userId}"
		def facebookResource = oauthService.getFacebookResource(facebookAccessToken, url)
		def facebookResponse = JSON.parse(facebookResource?.getBody())
		log.info("userId: " + facebookResponse.id + " name: " + facebookResponse.name)
		return [facebookResponse.id, facebookResponse.name]
	}

}
