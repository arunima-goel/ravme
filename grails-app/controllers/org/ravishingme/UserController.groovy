package org.ravishingme

import grails.converters.JSON
import org.scribe.model.Token

class UserController {
	def oauthService
	
		def index() {}
	
		def success() {
			Token facebookAccessToken = (Token) session[oauthService.findSessionKeyForAccessToken('facebook')]
			if (facebookAccessToken) {
				def facebookResource = oauthService.getFacebookResource(facebookAccessToken, "https://graph.facebook.com/me")
				def facebookResponse = JSON.parse(facebookResource?.getBody())
	
				Map data = [id: facebookResponse.id, username: facebookResponse.username, name: facebookResponse.name, email: facebookResponse.email,
						first_name: facebookResponse.first_name, last_name: facebookResponse.last_name, birthday: facebookResponse.birthday,
						gender: facebookResponse.gender, link: facebookResponse.link, work: facebookResponse.work, hometown: facebookResponse.hometown,
						education: facebookResponse.education]
	
				if ( !User.findById(facebookResponse.id) ) {
					// TODO: this should go into a transactional service
					def role = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
					def user = new User("facebook_" + facebookResponse.id, facebookResponse.id).save(failOnError: true)
					if (!user.authorities.contains(role)) {
						UserRole.create user, role
					}
				}
				
				render data
			} else {
				flash.error = "Token not found."
				Map data = [response: "false"]
				render data
			}
		}
	
		def error() {
			render params
		}
}
