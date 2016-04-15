package com.askari

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MentoreeController {

	static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Mentoree.list(params), model:[mentoreeInstanceCount: Mentoree.count()]
    }

    def show(Mentoree mentoreeInstance) {
        respond mentoreeInstance
    }

    def create() {
        respond new Mentoree(params)
    }

    @Transactional
    def save(Mentoree mentoreeInstance) {
        if (mentoreeInstance == null) {
            notFound()
            return
        }

        if (mentoreeInstance.hasErrors()) {
            respond mentoreeInstance.errors, view:'create'
            return
        }

        mentoreeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'mentoree.label', default: 'Mentoree'), mentoreeInstance.id])
                redirect mentoreeInstance
            }
            '*' { respond mentoreeInstance, [status: CREATED] }
        }
    }

    def edit(Mentoree mentoreeInstance) {
        respond mentoreeInstance
    }

    @Transactional
    def update(Mentoree mentoreeInstance) {
        if (mentoreeInstance == null) {
            notFound()
            return
        }

        if (mentoreeInstance.hasErrors()) {
            respond mentoreeInstance.errors, view:'edit'
            return
        }

        mentoreeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Mentoree.label', default: 'Mentoree'), mentoreeInstance.id])
                redirect mentoreeInstance
            }
            '*'{ respond mentoreeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Mentoree mentoreeInstance) {

        if (mentoreeInstance == null) {
            notFound()
            return
        }

        mentoreeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Mentoree.label', default: 'Mentoree'), mentoreeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'mentoree.label', default: 'Mentoree'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
