class UrlMappings {

	static mappings = {p
		group "/api", {
			"/mentors"(controller: "user", action: 'listMentors', method: "GET")
			"/mentees"(controller: "user", action: 'listMentees', method: "GET")
			"/user"(controller: "user", action: 'createUser', method: "POST")
			"/user"(controller: "user", action: 'readUser', method: "GET")
			"/login"(controller: "login", action: 'login', method: "POST")
			"/photo/$id?"(controller: "photo", action: 'uploadPhoto', method: "POST")
			"/addFakeUsers"(controller: "user", action: 'makeFakeUsers', method: "GET")
			
			"/connect/$mentorId?/$menteeId?"(controller: "connection", action: 'makeConnection', method: "GET")
			"/connect/$id?/confirmed"(controller: "connection", action: 'listConfirmedConnectionsForUser', method: "GET")
			"/connect/$id?/unconfirmed"(controller: "connection", action: 'listNonConfirmedConnectionsForUser', method: "GET")
			"/connect/$id?"(controller: "connection", action: 'listConnectionsForUser', method: "GET")
			"/connect/$id?"(controller: "connection", action: 'removeConnection', method: "DELETE")
			"/connect/confirm/$id?"(controller: "connection", action: 'confirmConnection', method: "GET")
			
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
