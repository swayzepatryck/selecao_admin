require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class EnrolledSurveyAnswersController < ApplicationController
    # GET /enrolled_survey_answers
    # GET /enrolled_survey_answers.json
    def index
      @enrolled_survey_answers = EnrolledSurveyAnswer.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @enrolled_survey_answers }
      end
    end
  
    # GET /enrolled_survey_answers/1
    # GET /enrolled_survey_answers/1.json
    def show
      @enrolled_survey_answer = EnrolledSurveyAnswer.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @enrolled_survey_answer }
      end
    end
  
    # GET /enrolled_survey_answers/new
    # GET /enrolled_survey_answers/new.json
    def new
      @enrolled_survey_answer = EnrolledSurveyAnswer.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @enrolled_survey_answer }
      end
    end
  
    # GET /enrolled_survey_answers/1/edit
    def edit
      @enrolled_survey_answer = EnrolledSurveyAnswer.find(params[:id])
    end
  
    # POST /enrolled_survey_answers
    # POST /enrolled_survey_answers.json
    def create
      @enrolled_survey_answer = EnrolledSurveyAnswer.new(params[:enrolled_survey_answer])
  
      respond_to do |format|
        if @enrolled_survey_answer.save
          format.html { redirect_to @enrolled_survey_answer, :notice => t('selecao_admin.flash_messages.successfully_created.', :model => @enrolled_survey_answer.class.model_name.human) }
          format.json { render :json => @enrolled_survey_answer, :status => :created, :location => @enrolled_survey_answer }
        else
          format.html { render :action => "new" }
          format.json { render :json => @enrolled_survey_answer.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /enrolled_survey_answers/1
    # PUT /enrolled_survey_answers/1.json
    def update
      @enrolled_survey_answer = EnrolledSurveyAnswer.find(params[:id])
  
      respond_to do |format|
        if @enrolled_survey_answer.update_attributes(params[:enrolled_survey_answer])
          format.html { redirect_to @enrolled_survey_answer, :notice => t('selecao_admin.flash_messages.successfully_updated.', :model => @enrolled_survey_answer.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @enrolled_survey_answer.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /enrolled_survey_answers/1
    # DELETE /enrolled_survey_answers/1.json
    def destroy
      @enrolled_survey_answer = EnrolledSurveyAnswer.find(params[:id])
      @enrolled_survey_answer.destroy
  
      respond_to do |format|
        format.html { redirect_to enrolled_survey_answers_url }
        format.json { head :no_content }
      end
    end
  end
end
