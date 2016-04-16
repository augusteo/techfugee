package com.askari

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON

class ConnectionController {

	def makeConnection(User mentor, User mentee){
		
		if ((mentor==null)||(mentee==null)) {
			log.error("Mentor or mentee does not exist");
            response.status = NOT_ACCEPTABLE.value()
			return
		}
		
		if (mentor.isMentor==false){
			log.error("Mentor cannot be a mentee");
			response.status = NOT_ACCEPTABLE.value()
			return	
		}
		
		if (mentee.isMentor==true){
			log.error("Mentee cannot be a mentor");
			response.status = NOT_ACCEPTABLE.value()
			return
		}
		
		Connection connection = new Connection(mentor, mentee)
		
		connection.save(flush:true)
		
		render connection as JSON
		render status: OK
	}
	
	def listConnectionsForUser(User userInstance){
		if (userInstance==null) {
			log.error("User does not exist");
			response.status = NOT_ACCEPTABLE.value()
			return
		}
		
		List<Connection> connections = null
		if (userInstance.isMentor){
			connections = Connection.findByMentor(userInstance)
		} else{
			connections = Connection.findByMentee(userInstance)
		}
		
		return connections
	}
	
	def listConfirmedConnectionsForUser(User userInstance){
		if (userInstance==null) {
			log.error("User does not exist");
			response.status = NOT_ACCEPTABLE.value()
			return
		}
		
		List<Connection> connections = null
		if (userInstance.isMentor){
			connections = Connection.findByMentorAndIsConfirmed(userInstance, true)
		} else{
			connections = Connection.findByMenteeAndIsConfirmed(userInstance, true)
		}
		
		return connections
	}
	
	
	def listNonConfirmedConnectionsForUser(User userInstance){
		if (userInstance==null) {
			log.error("User does not exist");
			response.status = NOT_ACCEPTABLE.value()
			return
		}
		
		List<Connection> connections = null
		if (userInstance.isMentor){
			connections = Connection.findByMentorAndIsConfirmed(userInstance, false)
		} else{
			connections = Connection.findByMenteeAndIsConfirmed(userInstance, false)
		}
		
		return connections
	}
	
	
	def removeConnection(Connection connection){
		
		if (connection==null) {
			log.error("Connection does not exist");
			response.status = NOT_ACCEPTABLE.value()
			return
		}
		
		connection.delete(flush:true)
		render status: OK
	}
	
	def confirmConnection(Connection connection){
		
		if (connection==null) {
			log.error("Connection does not exist");
			response.status = NOT_ACCEPTABLE.value()
			return
		}
		
		connection.setIsConfirmed(true)
		
		connection.save(flush:true)
		render status: OK
	}
	
	
	
    def index() { }
}
