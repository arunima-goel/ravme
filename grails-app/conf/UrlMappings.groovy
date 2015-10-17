class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

		name aboutus: "/aboutus"(view:"/aboutus")
		"/"(view:"/index")
		"/profile/$username?" (controller: "profile", action: "index")
		"/profile/edit/$name?"(controller:"profile", action:"edit")
        "/profile/removeFavorite"(controller:"profile", action:"removeFavorite")
        "500"(view:'/error')
	}
}
