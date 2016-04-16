package com.askari

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON

@Transactional(readOnly = true)
class MentoreeController {

	/*
	def mentoreeService
	
	static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
		List<Mentoree> mentoreeList = mentoreeService.readAll()
		
		render mentoreeList as JSON
		render status: OK
    }

    def show(Mentoree mentoreeInstance) {
		if (mentoreeInstance == null) {
			render status: NOT_FOUND
			return
		}

		render mentoreeInstance as JSON
		render status: OK
    }

	
    def create(Mentoree mentoreeInstance) {
		mentoreeService.create(mentoreeInstance)
    }
	

    @Transactional
    def update(Mentoree mentoreeInstance) {
        if (mentoreeInstance == null) {
            render status: NOT_FOUND
            return
        }

		mentoreeInstance = mentoreeService.update(mentoreeInstance)

		render mentoreeInstance as JSON
		render status: OK
    }

	
    @Transactional
    def delete(Mentoree mentoreeInstance) {

        if (mentoreeInstance == null) {
            render status: NOT_FOUND
            return
        }

		mentoreeService.delete(mentoreeInstance)
		
		render status: OK
	}
	*/

}
