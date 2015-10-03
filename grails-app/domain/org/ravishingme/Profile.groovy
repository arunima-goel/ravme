package org.ravishingme

import java.util.Date;
import java.util.List;

class Profile implements Serializable {

	Profile(String _username) {
		username = _username
	}

	// add photos
	String username // need to autogenerate this
//	String aboutYou // will this have a limit?
//	String locationsServed // checked combo box on the UI and a list here based on location
//	String baseLocation // combo box containing states
//	Date lastUpdated
//	Date createDate
//	List cosmeticBrands // checked combo box? comma separated list will do for now
//	List specialities // checked combo box? comma separated list will do for now
//	List modesOfPayment // what modes of payment are available in india?
//	String phoneNumber // required? what data type?
//	String businessHours
//	Double startingPrice // Floating / Decimal
//	String accomplishments
//	Integer yearsOfExperience // do we need this?
//	Boolean isArtist
//	String socialNetworks // split this into different networks? figure out how I will model this

	//static hasMany = [photos: Photo]
//	static hasMany = [services: Service, favorites: User]
//	static belongsTo = [user: User]

	static constraints = {
		username blank: false, nullable: false, editable: false
//		locationsServed blank: false, nullable: false
//		baseLocation blank: false, nullable: false
//		lastUpdated nullable: false
//		createDate nullable: false
//		cosmeticBrands blank: false, nullable: false
//		modesOfPayment blank: false, nullable: false
//		businessHours blank: false, nullable: false
//		startingPrice blank: false, nullable: false
//		yearsOfExperience blank: false, nullable: false
//		isArtist blank: false, nullable: false
//		socialNetworks blank: false, nullable: false
//		aboutYou maxSize: 250
//		modesOfPayment blank: false, nullable: false, inList:["Cash", "Cheque", "Credit Card", "Debit Card"].subsequences() as List
//		cosmeticBrands blank: false, nullable: false
	}
}
