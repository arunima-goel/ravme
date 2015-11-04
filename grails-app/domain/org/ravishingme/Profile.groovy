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
	List modesOfPayment // what modes of payment are available in india?
	String phoneNumber // required? what data type?
	String businessHours
	Double startingPrice // Floating / Decimal
	String accomplishments
	Integer yearsOfExperience // do we need this?
	Boolean isArtist
	String socialNetworks // split this into different networks? figure out how I will model this
	List<CosmeticBrand> cosmeticBrands
	
	//static hasMany = [photos: Photo]
	static hasOne = [profilePic: Image, coverPic: Image]
	static hasMany = [services: Service, favorites: Profile, albums: Album,
		specialities: Speciality, cosmeticBrands: CosmeticBrand]
	static belongsTo = [user: User]
	static searchable = {
		except = ['profilePic', 'coverPic', 'user', 'specialities', 'services']
		cosmeticBrands reference:true
	}

	static constraints = {
		username blank: false, nullable: false, editable: false
		locationsServed nullable: true
		baseLocation nullable: true
		modesOfPayment nullable: true
		businessHours nullable: true
		startingPrice nullable: true
		yearsOfExperience nullable: true
		isArtist blank: false, nullable: false
		socialNetworks nullable: true
		aboutYou nullable:true, maxSize: 250
		modesOfPayment nullable: true, inList:["Cash", "Cheque", "Credit Card", "Debit Card"].subsequences() as List
		accomplishments nullable: true
		phoneNumber nullable: true
	}
}
