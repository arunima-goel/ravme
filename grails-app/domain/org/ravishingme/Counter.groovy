package org.ravishingme

import java.util.Date;

class Counter {
	String name
	long sequence
	Date lastUpdated
	Date dateCreated
	
	static constraints = {
		name blank: false, unique: true
		sequence blank: false
	}
	
	Counter(String name, long sequence) {
		this()
		this.name = name
		this.sequence = sequence
	}
}
