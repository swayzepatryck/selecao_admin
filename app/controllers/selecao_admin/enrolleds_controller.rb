require_dependency "selecao_admin/application_controller"
require 'datatables/enrolleds_datatable.rb'

module SelecaoAdmin
  class EnrolledsController < ApplicationController
    layout :resolve_layout
    # GET /enrolleds
    # GET /enrolleds.json    
    def index      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => SelecaoAdmin::EnrolledsDatatable.new(view_context) }
      end
    end
  
    # GET /enrolleds/1
    # GET /enrolleds/1.json
    def show
      @enrolled = Enrolled.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @enrolled }
      end
    end
  
    # GET /enrolleds/new
    # GET /enrolleds/new.json
    def new
      @enrolled = Enrolled.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @enrolled }
      end
    end
  
    # GET /enrolleds/1/edit
    def edit
      @enrolled = Enrolled.find(params[:id])
    end
  
    # POST /enrolleds
    # POST /enrolleds.json
    def create
      @enrolled = Enrolled.new(params[:enrolled])
  
      respond_to do |format|
        if @enrolled.save
          format.html { redirect_to @enrolled, :notice => t('selecao_admin.flash_messages.successfully_created.', :model => @enrolled.class.model_name.human) }
          format.json { render :json => @enrolled, :status => :created, :location => @enrolled }
        else
          format.html { render :action => "new" }
          format.json { render :json => @enrolled.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /enrolleds/1
    # PUT /enrolleds/1.json
    def update
      @enrolled = Enrolled.find(params[:id])
  
      respond_to do |format|
        if @enrolled.update_attributes(params[:enrolled])
          format.html { redirect_to @enrolled, :notice => t('selecao_admin.flash_messages.successfully_updated.', :model => @enrolled.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @enrolled.errors, :status => :unprocessable_entity }
        end
      end
    end
   
    # DELETE /enrolleds/1
    # DELETE /enrolleds/1.json
    def destroy
      @enrolled = Enrolled.find(params[:id])
      @enrolled.destroy
  
      respond_to do |format|
        format.html { redirect_to enrolleds_url }
        format.json { head :no_content }
        format.js
      end
    end
    
    def user
      @result = Hash.new
      @result[:name] = SelecaoAdmin::Enrolled.find(params[:enrolled_id]).user.name

      respond_to do |format|
        format.json {render :json => @result}
      end
    end
    
    private

    def resolve_layout
      case action_name
        when "show","new", "edit", "update", "create"
          "selecao_admin/no_sidebar"
        else
          "selecao_admin/application"
      end          
    end            
  end
end
