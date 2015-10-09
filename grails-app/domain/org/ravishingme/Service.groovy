package org.ravishingme

import java.util.Date;

class Service {
	String serviceGroup
	String serviceName
	Double price
	Date lastUpdated
	Date dateCreated
	
	static belongsTo = [profile: Profile]
	
	static constraints = {
		serviceGroup blank: false, nullable: false
		serviceName blank: false, nullable: false
		price blank: false, nullable: false
	}	
}
