package com.askari

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MentorController {

	/*
	def mentorService
	
	static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Mentor.list(params), model:[MentorInstanceCount: Mentor.count()]
    }

    def show(Mentor MentorInstance) {
        respond MentorInstance
    }

    def create() {
        respond new Mentor(params)
    }

    @Transactional
    def save(Mentor MentorInstance) {
        if (MentorInstance == null) {
            notFound()
            return
        }

        if (MentorInstance.hasErrors()) {
            respond MentorInstance.errors, view:'create'
            return
        }

        MentorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'Mentor.label', default: 'Mentor'), MentorInstance.id])
                redirect MentorInstance
            }
            '*' { respond MentorInstance, [status: CREATED] }
        }
    }

    def edit(Mentor MentorInstance) {
        respond MentorInstance
    }

    @Transactional
    def update(Mentor MentorInstance) {
        if (MentorInstance == null) {
            notFound()
            return
        }

        if (MentorInstance.hasErrors()) {
            respond MentorInstance.errors, view:'edit'
            return
        }

        MentorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Mentor.label', default: 'Mentor'), MentorInstance.id])
                redirect MentorInstance
            }
            '*'{ respond MentorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Mentor MentorInstance) {

		MentoreeService.del
		
        if (MentorInstance == null) {
            notFound()
            return
        }
		
		
		

        MentorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Mentor.label', default: 'Mentor'), MentorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'Mentor.label', default: 'Mentor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    */
}
