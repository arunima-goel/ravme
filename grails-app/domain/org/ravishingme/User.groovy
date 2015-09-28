package org.ravishingme

class User implements Serializable {

	private static final long serialVersionUID = 1

	String username
	String userid // fb id
	
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	
	User(String username, String userid) {
		this()
		this.username = username
		this.userid = userid
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof User && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	static constraints = {
		username blank: false, unique: true
		id blank: false, unique: true
	}
}
