require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class EnrollmentEnrolledsController < ApplicationController
    # GET /enrollment_enrolleds
    # GET /enrollment_enrolleds.json
    def index
      @enrollment_enrolleds = EnrollmentEnrolleds.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @enrollment_enrolleds }
      end
    end
  
    # GET /enrollment_enrolleds/1
    # GET /enrollment_enrolleds/1.json
    def show
      @enrollment_enrolleds = EnrollmentEnrolleds.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @enrollment_enrolleds }
      end
    end
  
    # GET /enrollment_enrolleds/new
    # GET /enrollment_enrolleds/new.json
    def new
      @enrollment_enrolleds = EnrollmentEnrolleds.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @enrollment_enrolleds }
      end
    end
  
    # GET /enrollment_enrolleds/1/edit
    def edit
      @enrollment_enrolleds = EnrollmentEnrolleds.find(params[:id])
    end
  
    # POST /enrollment_enrolleds
    # POST /enrollment_enrolleds.json
    def create
      @enrollment_enrolleds = EnrollmentEnrolleds.new(params[:enrollment_enrolleds])
  
      respond_to do |format|
        if @enrollment_enrolleds.save
          format.html { redirect_to @enrollment_enrolleds, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @enrollment_enrolleds.class.model_name.human) }
          format.json { render :json => @enrollment_enrolleds, :status => :created, :location => @enrollment_enrolleds }
        else
          format.html { render :action => "new" }
          format.json { render :json => @enrollment_enrolleds.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /enrollment_enrolleds/1
    # PUT /enrollment_enrolleds/1.json
    def update
      @enrollment_enrolleds = EnrollmentEnrolleds.find(params[:id])
  
      respond_to do |format|
        if @enrollment_enrolleds.update_attributes(params[:enrollment_enrolleds])
          format.html { redirect_to @enrollment_enrolleds, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @enrollment_enrolleds.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @enrollment_enrolleds.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /enrollment_enrolleds/1
    # DELETE /enrollment_enrolleds/1.json
    def destroy
      @enrollment_enrolleds = EnrollmentEnrolleds.find(params[:id])
      @enrollment_enrolleds.destroy
  
      respond_to do |format|
        format.html { redirect_to enrollment_enrolleds_url }
        format.json { head :no_content }
      end
    end
  end
end
