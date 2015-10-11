package org.ravishingme

import grails.converters.JSON

import org.scribe.model.Token

class MailController {
	def testAction() {
		log.info("Sending email")
		sendMail {
			to "goel.arunima@gmail.com"
			subject "This is a test mail"
			html g.render(template:'/mail/test', model:[name:'John Doe'])
		}
	}
}
