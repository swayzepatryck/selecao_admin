require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class EnrollmentsController < ApplicationController
    layout :resolve_layout
    # GET /enrollments
    # GET /enrollments.json
    def index
      @enrollments = Enrollment.where(:announcement_id => params[:announcement_id])
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @enrollments }
      end
    end
  
    # GET /enrollments/1
    # GET /enrollments/1.json
    def show
      @enrollment = Enrollment.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @enrollment }
      end
    end
  
    # GET /enrollments/new
    # GET /enrollments/new.json
    def new
      @enrollment = Enrollment.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @enrollment }
      end
    end
  
    # GET /enrollments/1/edit
    def edit
      @enrollment = Enrollment.find(params[:id])
    end
  
    # POST /enrollments
    # POST /enrollments.json
    def create
      @enrollment = Enrollment.new(params[:enrollment])
      @enrollment.build_drawing
  
      respond_to do |format|
        if @enrollment.save
          format.html { redirect_to announcement_enrollment_path(@enrollment.announcement, @enrollment), :notice => t('selecao_admin.flash_messages.successfully_created', :model => @enrollment.class.model_name.human) }
          format.json { render :json => @enrollment, :status => :created, :location => @enrollment }
        else
          format.html { render :action => "new" }
          format.json { render :json => @enrollment.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /enrollments/1
    # PUT /enrollments/1.json
    def update
      @enrollment = Enrollment.find(params[:id])
  
      respond_to do |format|
        if @enrollment.update_attributes(params[:enrollment])
          format.html { redirect_to announcement_enrollment_path(@enrollment.announcement, @enrollment), :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @enrollment.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @enrollment.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /enrollments/1
    # DELETE /enrollments/1.json
    def destroy
      @enrollment = Enrollment.find(params[:id])
      @enrollment.destroy
  
      respond_to do |format|
        format.html { redirect_to announcement_enrollments_url }
        format.json { head :no_content }
        format.js
      end
    end
    
    private
    
    def resolve_layout
      case action_name
        when "index", "create", "new", "edit", "update"
          "selecao_admin/application"
        else
          "selecao_admin/no_sidebar"
      end          
    end    
    
  end
end
