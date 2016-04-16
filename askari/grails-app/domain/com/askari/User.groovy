package com.askari

class User {

	String email
	String password
	Boolean isMentor
	String name
	String title
	String city
	String state
	String mainField
	String lookingFor
	String bio
	String photo
	String industry
	String language
	
	public static User dummyUser(String name, boolean isMentor){
		User user = new User();
		user.name = name
		
		user.email = "user@user.com"
		user.password = "password"
		user.isMentor = isMentor
		user.title = "Title"
		user.city = "Melbourne"
		user.state = "VIC"
		user.mainField = "MAIN FIELD"
		user.lookingFor = "lookingFor"
		user.bio = "bio"
		user.photo = "photo"
		user.industry = "Industry"
		user.language = "English"
		return user
	}
	
    static constraints = {
    }
	
	
}
