def askari.xyz_website do
    as a 'User' i want to 'know what is the problem you are solving'
    as a 'User' i want to 'know where to download the app'
    as a 'User' i want to 'know who the maker of this app are'
    as a 'User' i want to 'contact the maker for feedback'
end

def backend_aydan do
    GET     'api/mentors'   returns '{[ mentorModel ]}'
    GET     'api/mentees'   returns '{[ menteeModel ]}'
    POST    'api/mentee'    params '{menteeModel}' returns  '200'
    POST    'api/mentor'    params '{mentorModel}' returns  '200'
    POST    'api/photo/id'     body 'photo binary'
    basic auth with username & password
end

def iOS do
    as a 'first time user' i want to 'know what problem the app is solving'
    as a 'first time user' i want to 'register as mentee'
    as a 'first time user' i want to 'register as mentor'
    
    as a 'returning user' i want to 'login using email & password'
    as a 'returning user' i want to 'read T&C'
    as a 'returning user' i want to 'read privacy policy'
    as a 'returning user' i want to 'contact the makers for app feedback'

    as a 'mentee' i want to 'edit my profile'
    as a 'mentee' i want to 'upload my profile photo'
    as a 'mentee' i want to 'find mentors that is in my industry'
    as a 'mentee' i want to 'request mentorship with my desired mentor'
    as a 'mentee' i want to 'see my connected mentors'
    as a 'mentee' i want to 'chat with my connected mentor'

    as a 'mentor' i want to 'edit my profile'
    as a 'mentor' i want to 'upload my profile photo'
    as a 'mentor' i want to 'find mentee that is in my industry'
    as a 'mentor' i want to 'offer mentorshio to my desired mentee'
    as a 'mentor' i want to 'see my connected mentee'
    as a 'mentor' i want to 'chat with my connected mentee'
end



















