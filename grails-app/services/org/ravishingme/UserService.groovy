package org.ravishingme

import grails.converters.JSON
import grails.transaction.Transactional

import org.scribe.model.Token

@Transactional(readOnly = true)
class UserService {

	def counterService

	def createUser(String name, String userId) {
		def username = counterService.getNextUsernameInSequence(name.split(" ").join("-"))
		def role = Role.findByAuthority("ROLE_USER") ?: new Role(authority: "ROLE_USER").save(failOnError: true)
		
		def profile = new Profile(username, name);
		profile.profilePic = new Image(null, null);
		def user = new User(userId, username,  profile)
		user.save(failOnError: true)
		
		if (!user.authorities.contains(role)) {
			UserRole.create user, role
		}
	}
}
