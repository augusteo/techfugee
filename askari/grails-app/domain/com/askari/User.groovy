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
	
	public User(String email,
	String password,
	Boolean isMentor,
	String name,
	String title,
	String city,
	String state,
	String mainField,
	String lookingFor,
	String bio,
	String photo,
	String industry){
		this.email = email
		this.password = password
		this.isMentor = isMentor
		this.name = name
		this.title = title
		this.city = city
		this.state = state
		this.mainField = mainField
		this.lookingFor = lookingFor
		this.bio = bio
		this.photo = photo
		this.industry = industry
	}
	
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
		return user
	}
	
    static constraints = {
    }
	
	
}
