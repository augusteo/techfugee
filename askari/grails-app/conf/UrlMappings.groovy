class UrlMappings {

	static mappings = {p
		group "/api", {
			"/mentors"(controller: "user", action: 'listMentors', method: "GET")
			"/mentees"(controller: "user", action: 'listMentees', method: "GET")
			"/user"(controller: "user", action: 'createUser', method: "POST")
			"/user"(controller: "user", action: 'readUser', method: "GET")
		}
		"/"(view:"/index")
		"500"(view:'/error')
	}
	/*	
	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
	}
	*/
}
