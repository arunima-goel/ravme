package org.ravishingme

import grails.converters.JSON

import org.scribe.model.Token

class SearchController {
	def oauthService
	def userService

	def index() {
		log.info("Search - index")
	}

	def search() {
		log.info("Search - search")
	}
}
