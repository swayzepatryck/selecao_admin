require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class LecturesController < ApplicationController
    layout 'selecao_admin/no_sidebar'
    # GET /lectures
    # GET /lectures.json
    def index
      @lectures = Lecture.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @lectures }
      end
    end
  
    # GET /lectures/1
    # GET /lectures/1.json
    def show
      if params[:lecture_presence_id]
        @lecture_presence = LecturePresence.find(params[:lecture_presence_id])
        if @lecture_presence.attendance_lecture_presence_status_id == 1
          @lecture_presence.attendance_lecture_presence_status_id = 2
        elsif  @lecture_presence.attendance_lecture_presence_status_id == 2
          @lecture_presence.attendance_lecture_presence_status_id = 1
        end
        
        if @lecture_presence.save
          respond_to do |format|
            format.html # show.html.erb
            format.json { render :json => @lecture }
            format.js
          end                          
        end        
      else
        @lecture = Lecture.find(params[:id])        
        
        respond_to do |format|
          format.html # show.html.erb
          format.json { render :json => @lecture }
        end        
      end  
    end
  
    # GET /lectures/new
    # GET /lectures/new.json
    def new
      @lecture = Lecture.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @lecture }
      end
    end
  
    # GET /lectures/1/edit
    def edit
      @lecture = Lecture.find(params[:id])
    end
  
    # POST /lectures
    # POST /lectures.json
    def create
      @lecture = Lecture.new(params[:lecture])
  
      respond_to do |format|
        if @lecture.save
          format.html { redirect_to @lecture, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @lecture.class.model_name.human) }
          format.json { render :json => @lecture, :status => :created, :location => @lecture }
        else
          format.html { render :action => "new" }
          format.json { render :json => @lecture.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /lectures/1
    # PUT /lectures/1.json
    def update
      @lecture = Lecture.find(params[:id])
  
      respond_to do |format|
        if @lecture.update_attributes(params[:lecture])
          format.html { redirect_to @lecture, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @lecture.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @lecture.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /lectures/1
    # DELETE /lectures/1.json
    def destroy
      @lecture = Lecture.find(params[:id])
      @lecture.destroy
  
      respond_to do |format|
        format.html { redirect_to lectures_url }
        format.json { head :no_content }
        format.js
      end
    end
  end
end
