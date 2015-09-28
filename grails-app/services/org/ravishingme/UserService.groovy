package org.ravishingme

import grails.converters.JSON
import grails.transaction.Transactional

import org.scribe.model.Token

@Transactional(readOnly = true)
class UserService {

	def oauthService
	
	def getUser(Token facebookAccessToken) {
		

		return [data]
	}
	
	def createUser(Token facebookAccessToken) {
		if (!facebookAccessToken) {
			throw new CustomException("Token not found.")
		}

		def facebookResource = oauthService.getFacebookResource(facebookAccessToken, "https://graph.facebook.com/me")
		def facebookResponse = JSON.parse(facebookResource?.getBody())

		Map data = [id: facebookResponse.id, username: facebookResponse.username, name: facebookResponse.name, email: facebookResponse.email,
					first_name: facebookResponse.first_name, last_name: facebookResponse.last_name, birthday: facebookResponse.birthday,
					gender: facebookResponse.gender, link: facebookResponse.link, work: facebookResponse.work, hometown: facebookResponse.hometown,
					education: facebookResponse.education]
		
		def userId = facebookResponse.id
		if ( !User.findByUserid(userId) ) {
			// TODO: this should go into a transactional service
			def role = Role.findByAuthority("ROLE_USER") ?: new Role(authority: "ROLE_USER").save(failOnError: true)
			def user = new User("facebook_" + userId, userId).save(failOnError: true)
			if (!user.authorities.contains(role)) {
				UserRole.create user, role
			}
		}
		return [data]
	}
}
