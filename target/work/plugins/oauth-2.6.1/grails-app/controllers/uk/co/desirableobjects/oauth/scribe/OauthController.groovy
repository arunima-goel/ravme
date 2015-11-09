package uk.co.desirableobjects.oauth.scribe

import org.scribe.model.Token
import org.scribe.model.Verifier

import sun.reflect.generics.visitor.Reifier;
import uk.co.desirableobjects.oauth.scribe.holder.RedirectHolder

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

import uk.co.desirableobjects.oauth.scribe.exception.MissingRequestTokenException

class OauthController {

    private static final Token EMPTY_TOKEN = new Token('', '')

    OauthService oauthService

    def callback() {

        String providerName = params.provider
        OauthProvider provider = oauthService.findProviderConfiguration(providerName)

        Verifier verifier = extractVerifier(provider, params)

        if (!verifier) {
            redirect(uri: provider.failureUri)
            return
        }

        Token requestToken = provider.oauthVersion == SupportedOauthVersion.TWO ?
            new Token(params?.code, "") :
            (Token) session[oauthService.findSessionKeyForRequestToken(providerName)]

        if (!requestToken) {
            throw new MissingRequestTokenException(providerName)
        }
        
        Token accessToken

        try {
            accessToken = oauthService.getAccessToken(providerName, requestToken, verifier)
        } catch(OAuthException){
            log.error("Cannot authenticate with oauth")
            return redirect(uri: provider.failureUri)
        }
        
        session[oauthService.findSessionKeyForAccessToken(providerName)] = accessToken
        session.removeAttribute(oauthService.findSessionKeyForRequestToken(providerName))

		log.info("Forward uri in OauthController plugin: " + request.forwardURI)
		log.info("Redirect url: " + RedirectHolder.getRedirect().uri)
		
		if (RedirectHolder.getRedirect().uri != "" && RedirectHolder.getRedirect().uri != "/") {
			String redirectUri = RedirectHolder.getRedirect().uri;
			//redirectUri = redirectUri.substring(6, redirectUri.length());
			log.info("\n\n\nFinal redirect uri: " + redirectUri)
			return redirect(uri: redirectUri, params: [username: "Arunima-Goel"])
		} else {
        	return redirect(uri: provider.successUri, params: [username: "Arunima-Goel"])
		}
    }

    private Verifier extractVerifier(OauthProvider provider, GrailsParameterMap params) {

        String verifierKey = determineVerifierKey(provider)

        if (!params[verifierKey]) {
             log.error("Cannot authenticate with oauth: Could not find oauth verifier in ${params}.")
             return null
        }

        String verification = params[verifierKey]
        return new Verifier(verification)

    }

    private String determineVerifierKey(OauthProvider provider) {

        return SupportedOauthVersion.TWO == provider.oauthVersion ? 'code' : 'oauth_verifier'

    }

    def authenticate() {
		log.info("\n===============================================================")
		log.info("\nCalling authenticate in OauthController plugin")
        String providerName = params.provider
        OauthProvider provider = oauthService.findProviderConfiguration(providerName)

        Token requestToken = EMPTY_TOKEN
        if (provider.oauthVersion == SupportedOauthVersion.ONE) {
            requestToken = provider.service.requestToken
        }

        session[oauthService.findSessionKeyForRequestToken(providerName)] = requestToken
        String url = oauthService.getAuthorizationUrl(providerName, requestToken)

        RedirectHolder.setUri(params.redirectUrl)
        log.info("\nRequest in OauthController plugin: " + request)
		log.info("\nForward uri in OauthController plugin: " + request.forwardURI)
		log.info("\nParams in OauthController plugin: " + params)
		log.info("\nUrl: " + url)
		log.info("\n===============================================================")
		return redirect(url: url)

    }

}
