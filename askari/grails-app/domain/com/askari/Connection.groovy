package com.askari

class Connection {

	User mentor
	User mentee
	Boolean isConfirmed = false
	
	public Connection(User mentor, User mentee){
		this.mentor= mentor
		this.mentee = mentee
		isConfirmed = false
	}
	
    static constraints = {
    }
}
