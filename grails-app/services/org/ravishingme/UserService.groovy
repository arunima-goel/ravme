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
		
		def profile = new Profile(username);
		def user = new User(username, userId, profile)
		user.save(failOnError: true)
		
		if (!user.authorities.contains(role)) {
			UserRole.create user, role
		}
	}
}
