package org.ravishingme

import java.util.Date;
import java.util.List;

class Profile implements Serializable {

	Profile(String username, String name) {
		this.name = name
		this.username = username
		this.isArtist = false
	}

	// add photos
	String name
	String username
	String aboutYou // will this have a limit?
	String locationsServed // checked combo box on the UI and a list here based on location
	String baseLocation // combo box containing states
	Date lastUpdated
	Date dateCreated
	List cosmeticBrands // checked combo box? comma separated list will do for now
	List specialities // checked combo box? comma separated list will do for now // fix spelling - change to 'specialties'
	List modesOfPayment // what modes of payment are available in india?
	String phoneNumber // required? what data type?
	String businessHours
	Double startingPrice // Floating / Decimal
	String accomplishments
	Integer yearsOfExperience // do we need this?
	Boolean isArtist
	String socialNetworks // split this into different networks? figure out how I will model this
	byte[] avatar
	String avatarType
	
	//static hasMany = [photos: Photo]
	static hasMany = [services: Service, favorites: Profile]
	static belongsTo = [user: User]
	

	static constraints = {
		username blank: false, nullable: false, editable: false
		locationsServed nullable: true
		baseLocation nullable: true
		cosmeticBrands nullable: true
		modesOfPayment nullable: true
		businessHours nullable: true
		startingPrice nullable: true
		yearsOfExperience nullable: true
		isArtist blank: false, nullable: false
		socialNetworks nullable: true
		aboutYou nullable:true, maxSize: 250
		modesOfPayment nullable: true, inList:["Cash", "Cheque", "Credit Card", "Debit Card"].subsequences() as List
		cosmeticBrands nullable: true
		accomplishments nullable: true
		specialities nullable: true
		phoneNumber nullable: true
		avatar nullable:true, maxSize: 1024 * 1024 * 2 /* 2MB */
		avatarType(nullable:true)
	}
}
