package org.ravishingme

import grails.converters.JSON

import org.scribe.model.Token

class ServiceController {
	def delete() {
		log.info("Deleting service")
		Service service = Service.get(params.id)
		service.delete()
	}
}
