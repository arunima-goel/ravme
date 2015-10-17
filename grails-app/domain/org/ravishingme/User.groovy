package org.ravishingme

import java.util.Date;

class User implements Serializable {

	private static final long serialVersionUID = 1

	String userid // fb id
	Date lastUpdated
	Date dateCreated
	
	static hasOne = [profile:Profile]
	
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	
	User(String userid, Profile profile) {
		this()
		this.userid = userid
		this.profile = profile
	}

	@Override
	int hashCode() {
		userid?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof User && other.userid == userid)
	}

	@Override
	String toString() {
		userid
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	static constraints = {
		userid blank: false, unique: true
		id blank: false, unique: true
	}
}
