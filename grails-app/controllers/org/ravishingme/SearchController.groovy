package org.ravishingme

import grails.converters.JSON

import org.scribe.model.Token

class SearchController {
	def elasticSearchService

	def index() {
		log.info("Search - index")
	}

	def search() {
		log.info("Search - search: " + params)
	}
}
