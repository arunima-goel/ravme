package org.ravishingme

class Service {
	String serviceGroup
	String serviceName
	Double price
	
	static belongsTo = [profile: Profile]
	
	static constraints = {
		serviceGroup blank: false, nullable: false
		serviceName blank: false, nullable: false
		price blank: false, nullable: false
	}	
}
