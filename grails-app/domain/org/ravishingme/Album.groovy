package org.ravishingme

import java.util.Date;

class Album {
	String albumName
	
	static hasMany = [images: Image]	
	static belongsTo = [profile: Profile, album: Album]
	
	static constraints = {
		albumName nullable:false
	}
	
	Album(String albumName) {
		this.albumName = albumName
	}
	
}
