require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class SurveysController < ApplicationController
    layout :resolve_layout
    # GET /surveys
    # GET /surveys.json
    def index
      @surveys = Survey.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @surveys }
      end
    end
  
    # GET /surveys/1
    # GET /surveys/1.json
    def show
      @survey = Survey.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @survey }
      end
    end
  
    # GET /surveys/new
    # GET /surveys/new.json
    def new
      @survey = Survey.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @survey }
      end
    end
  
    # GET /surveys/1/edit
    def edit
      @survey = Survey.find(params[:id])
    end
  
    # POST /surveys
    # POST /surveys.json
    def create
      @survey = Survey.new(params[:survey])
  
      respond_to do |format|
        if @survey.save
          format.html { redirect_to @survey, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @survey.class.model_name.human) }
          format.json { render :json => @survey, :status => :created, :location => @survey }
        else
          format.html { render :action => "new" }
          format.json { render :json => @survey.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /surveys/1
    # PUT /surveys/1.json
    def update
      @survey = Survey.find(params[:id])
  
      respond_to do |format|
        if @survey.update_attributes(params[:survey])
          format.html { redirect_to @survey, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @survey.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @survey.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /surveys/1
    # DELETE /surveys/1.json
    def destroy
      @survey = Survey.find(params[:id])
      @survey.destroy
  
      respond_to do |format|
        format.html { redirect_to surveys_url }
        format.json { head :no_content }
        format.js        
      end
    end
    
    private
    
    def resolve_layout
      #case action_name
      #  when "index", "new", "show", "edit", "update"
          "selecao_admin/no_sidebar"
      #  else
      #    "selecao_admin/application"
      #end          
    end    
  end
end