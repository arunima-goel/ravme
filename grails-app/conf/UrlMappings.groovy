class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

		name aboutus: "/aboutus"(view:"/aboutus")
        "/"(view:"/index")
        "500"(view:'/error')
	}
}
