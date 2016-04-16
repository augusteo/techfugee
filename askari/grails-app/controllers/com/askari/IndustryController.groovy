package com.askari



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class IndustryController {
	
	static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Industry.list(params), model:[industryInstanceCount: Industry.count()]
    }

    def show(Industry industryInstance) {
        respond industryInstance
    }

    def create() {
        respond new Industry(params)
    }

    @Transactional
    def save(Industry industryInstance) {
        if (industryInstance == null) {
            notFound()
            return
        }

        if (industryInstance.hasErrors()) {
            respond industryInstance.errors, view:'create'
            return
        }

        industryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'industry.label', default: 'Industry'), industryInstance.id])
                redirect industryInstance
            }
            '*' { respond industryInstance, [status: CREATED] }
        }
    }

    def edit(Industry industryInstance) {
        respond industryInstance
    }

    @Transactional
    def update(Industry industryInstance) {
        if (industryInstance == null) {
            notFound()
            return
        }

        if (industryInstance.hasErrors()) {
            respond industryInstance.errors, view:'edit'
            return
        }

        industryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Industry.label', default: 'Industry'), industryInstance.id])
                redirect industryInstance
            }
            '*'{ respond industryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Industry industryInstance) {

        if (industryInstance == null) {
            notFound()
            return
        }

        industryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Industry.label', default: 'Industry'), industryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'industry.label', default: 'Industry'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
