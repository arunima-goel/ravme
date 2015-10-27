package org.ravishingme

import java.util.Date;

class Image {
	byte[] image
	String imageType
	
	static belongsTo = [profile: Profile]
	
	static constraints = {
		image nullable:true, maxSize: 1024 * 1024 * 2 /* 2MB */
		imageType(nullable:true)
	}
	
	Image(byte[] image, String imageType) {
		this.image = image
		this.imageType = imageType
	}
	
	Image() {
		
	}
}
