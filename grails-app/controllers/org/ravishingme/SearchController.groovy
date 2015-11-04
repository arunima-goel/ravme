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

		// query: firstName:”fname1”
		// "username:Arunima-Goel OR username:Amit-Rao"
		def res = elasticSearchService.search(
				 "cosmeticBrands { id: 3 }")
		def haveResults = true
		[query:params.query, total:res.total, searchResults:res.searchResults, haveResults:haveResults]

		log.info("Results" + res)
		render(template:'/profile/searchResults', collection: Profile.list())
	}
}
