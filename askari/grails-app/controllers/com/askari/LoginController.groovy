package com.askari

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON

class LoginController {

	static responseFormats = ['json', 'xml']
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
    def login() {
		HashMap<String,String> responseDict = new HashMap<String,String>();
		responseDict.put("result", "SUCCESS")
		render responseDict as JSON
		render status: OK
	}
}
