package com.askari

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON

class ConnectionController {

	static responseFormats = ['json', 'xml']
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def makeConnection(){
		
		Long mentorId = Long.parseLong(params.mentorId)
		Long menteeId = Long.parseLong(params.menteeId)
		
		User mentor = User.findById(mentorId)
		User mentee = User.findById(menteeId)
		
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
			connections = Connection.findAllByMentor(userInstance)
		} else{
			connections = Connection.findAllByMentee(userInstance)
		}
		
		render connections as JSON
		render status: OK
	}
	
	def listConfirmedConnectionsForUser(User userInstance){
		if (userInstance==null) {
			log.error("User does not exist");
			response.status = NOT_ACCEPTABLE.value()
			return
		}
		
		List<Connection> connections = null
		if (userInstance.isMentor){
			connections = Connection.findAllByMentorAndIsConfirmed(userInstance, true)
		} else{
			connections = Connection.findAllByMenteeAndIsConfirmed(userInstance, true)
		}
		
		render connections as JSON
		render status: OK
	}
	
	
	def listNonConfirmedConnectionsForUser(User userInstance){
		if (userInstance==null) {
			log.error("User does not exist");
			response.status = NOT_ACCEPTABLE.value()
			return
		}
		
		List<Connection> connections = null
		if (userInstance.isMentor){
			connections = Connection.findAllByMentorAndIsConfirmed(userInstance, false)
		} else{
			connections = Connection.findAllByMenteeAndIsConfirmed(userInstance, false)
		}
		
		render connections as JSON
		render status: OK
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
		
		render connection as JSON
		render status: OK
	}
	
	
	
    def index() { }
}
