package org.ravishingme

import grails.converters.JSON

import org.scribe.model.Token

class MailController {
	def testAction() {
		log.info("Sending email")
		sendMail {
			to "goel.arunima@gmail.com"
			subject "This is a test mail"
			from "goel.arunima@gmail.com"
			body "This is a test mail hello"
		}
		log.info("Sent email")
		
	}
}
