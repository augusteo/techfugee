package com.askari



import grails.test.mixin.*
import spock.lang.*

@TestFor(MentoreeController)
@Mock(Mentoree)
class MentoreeControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.mentoreeInstanceList
            model.mentoreeInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.mentoreeInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def mentoree = new Mentoree()
            mentoree.validate()
            controller.save(mentoree)

        then:"The create view is rendered again with the correct model"
            model.mentoreeInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            mentoree = new Mentoree(params)

            controller.save(mentoree)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/mentoree/show/1'
            controller.flash.message != null
            Mentoree.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def mentoree = new Mentoree(params)
            controller.show(mentoree)

        then:"A model is populated containing the domain instance"
            model.mentoreeInstance == mentoree
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def mentoree = new Mentoree(params)
            controller.edit(mentoree)

        then:"A model is populated containing the domain instance"
            model.mentoreeInstance == mentoree
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/mentoree/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def mentoree = new Mentoree()
            mentoree.validate()
            controller.update(mentoree)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.mentoreeInstance == mentoree

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            mentoree = new Mentoree(params).save(flush: true)
            controller.update(mentoree)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/mentoree/show/$mentoree.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/mentoree/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def mentoree = new Mentoree(params).save(flush: true)

        then:"It exists"
            Mentoree.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(mentoree)

        then:"The instance is deleted"
            Mentoree.count() == 0
            response.redirectedUrl == '/mentoree/index'
            flash.message != null
    }
}
