package org.ravishingme

class Counter {
	String name
	long sequence
	
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
