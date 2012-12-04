require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class CoursePrerequisitesController < ApplicationController
    # GET /course_prerequisites
    # GET /course_prerequisites.json
    def index
      @course_prerequisites = CoursePrerequisite.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @course_prerequisites }
      end
    end
  
    # GET /course_prerequisites/1
    # GET /course_prerequisites/1.json
    def show
      @course_prerequisite = CoursePrerequisite.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @course_prerequisite }
      end
    end
  
    # GET /course_prerequisites/new
    # GET /course_prerequisites/new.json
    def new
      @course_prerequisite = CoursePrerequisite.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @course_prerequisite }
      end
    end
  
    # GET /course_prerequisites/1/edit
    def edit
      @course_prerequisite = CoursePrerequisite.find(params[:id])
    end
  
    # POST /course_prerequisites
    # POST /course_prerequisites.json
    def create
      @course_prerequisite = CoursePrerequisite.new(params[:course_prerequisite])
  
      respond_to do |format|
        if @course_prerequisite.save
          format.html { redirect_to @course_prerequisite, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @course_prerequisite.class.model_name.human) }
          format.json { render :json => @course_prerequisite, :status => :created, :location => @course_prerequisite }
        else
          format.html { render :action => "new" }
          format.json { render :json => @course_prerequisite.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /course_prerequisites/1
    # PUT /course_prerequisites/1.json
    def update
      @course_prerequisite = CoursePrerequisite.find(params[:id])
  
      respond_to do |format|
        if @course_prerequisite.update_attributes(params[:course_prerequisite])
          format.html { redirect_to @course_prerequisite, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @course_prerequisite.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @course_prerequisite.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /course_prerequisites/1
    # DELETE /course_prerequisites/1.json
    def destroy
      @course_prerequisite = CoursePrerequisite.find(params[:id])
      @course_prerequisite.destroy
  
      respond_to do |format|
        format.html { redirect_to course_prerequisites_url }
        format.json { head :no_content }
      end
    end
  end
end
