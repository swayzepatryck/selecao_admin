require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class CoursesController < ApplicationController
    layout :resolve_layout
    include ActionView::Helpers::TextHelper
    # GET /courses
    # GET /courses.json
    def index
      @courses = Course.order(:id)
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @courses }
        format.pdf do 
          pdf = CoursePdf.new(:courses => Course.order(:name))
          send_data pdf.render, :filename => "Cursos x Nº de inscritos #{Time.now}", :type => "application/pdf", :disposition => "inline"
        end
      end
    end
  
    # GET /courses/1
    # GET /courses/1.json
    def show
      @course = Course.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @course }
      end
    end
  
    # GET /courses/new
    # GET /courses/new.json
    def new
      @course = Course.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @course }
      end
    end
  
    # GET /courses/1/edit
    def edit
      @course = Course.find(params[:id])
    end
  
    # POST /courses
    # POST /courses.json
    def create
      @course = Course.new(params[:course])
  
      respond_to do |format|
        if @course.save
          format.html { redirect_to @course, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @course.class.model_name.human) }
          format.json { render :json => @course, :status => :created, :location => @course }
          format.js
        else
          format.html { render :action => "new" }
          format.json { render :json => @course.errors, :status => :unprocessable_entity }
          format.js
        end
      end
    end
  
    # PUT /courses/1
    # PUT /courses/1.json
    def update
      @course = Course.find(params[:id])
  
      respond_to do |format|
        if @course.update_attributes(params[:course])
          format.html { redirect_to @course, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @course.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @course.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /courses/1
    # DELETE /courses/1.json
    def destroy
      @course = Course.find(params[:id])
      @course.destroy
  
      respond_to do |format|
        format.html { redirect_to courses_url }
        format.json { head :no_content }
        format.js
      end
    end
    
    private
    
    def resolve_layout
      case action_name
        when "index"
          "selecao_admin/no_sidebar"
        else
          "selecao_admin/application"
      end          
    end    
    
  end
end
