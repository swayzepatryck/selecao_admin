require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class SurveyQuestionOptionsController < ApplicationController
    # GET /survey_question_options
    # GET /survey_question_options.json
    def index
      @survey_question_options = SurveyQuestionOption.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @survey_question_options }
      end
    end
  
    # GET /survey_question_options/1
    # GET /survey_question_options/1.json
    def show
      @survey_question_option = SurveyQuestionOption.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @survey_question_option }
      end
    end
  
    # GET /survey_question_options/new
    # GET /survey_question_options/new.json
    def new
      @survey_question_option = SurveyQuestionOption.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @survey_question_option }
      end
    end
  
    # GET /survey_question_options/1/edit
    def edit
      @survey_question_option = SurveyQuestionOption.find(params[:id])
    end
  
    # POST /survey_question_options
    # POST /survey_question_options.json
    def create
      @survey_question_option = SurveyQuestionOption.new(params[:survey_question_option])
  
      respond_to do |format|
        if @survey_question_option.save
          format.html { redirect_to @survey_question_option, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @survey_question_option.class.model_name.human) }
          format.json { render :json => @survey_question_option, :status => :created, :location => @survey_question_option }
        else
          format.html { render :action => "new" }
          format.json { render :json => @survey_question_option.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /survey_question_options/1
    # PUT /survey_question_options/1.json
    def update
      @survey_question_option = SurveyQuestionOption.find(params[:id])
  
      respond_to do |format|
        if @survey_question_option.update_attributes(params[:survey_question_option])
          format.html { redirect_to @survey_question_option, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @survey_question_option.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @survey_question_option.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /survey_question_options/1
    # DELETE /survey_question_options/1.json
    def destroy
      @survey_question_option = SurveyQuestionOption.find(params[:id])
      @survey_question_option.destroy
  
      respond_to do |format|
        format.html { redirect_to survey_question_options_url }
        format.json { head :no_content }
      end
    end
  end
end
