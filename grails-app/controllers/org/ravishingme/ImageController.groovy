package org.ravishingme

import grails.converters.JSON

import org.scribe.model.Token

class ImageController {
	def view() {
		log.info("View image")
		def Image image = Image.get(params.id)
		response.contentType = image.imageType
		response.contentLength = image?.image.length
		response.outputStream.write(image.image)
	}
}
