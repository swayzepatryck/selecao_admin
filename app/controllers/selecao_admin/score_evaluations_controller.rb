require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class ScoreEvaluationsController < ApplicationController
    layout :resolve_layout
    # GET /score_evaluations
    # GET /score_evaluations.json
    def index
      @score_evaluations = ScoreEvaluation.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @score_evaluations }
      end
    end
  
    # GET /score_evaluations/1
    # GET /score_evaluations/1.json
    def show
      @score_evaluation = ScoreEvaluation.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @score_evaluation }
      end
    end
  
    # GET /score_evaluations/new
    # GET /score_evaluations/new.json
    def new
      @score_evaluation = ScoreEvaluation.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @score_evaluation }
      end
    end
  
    # GET /score_evaluations/1/edit
    def edit
      @score_evaluation = ScoreEvaluation.find(params[:id])
    end
  
    # POST /score_evaluations
    # POST /score_evaluations.json
    def create
      @score_evaluation = ScoreEvaluation.new(params[:score_evaluation])
    
      respond_to do |format|
        if @score_evaluation.save
          format.html { redirect_to @score_evaluation, :notice => t('selecao_admin.flash_messages.successfully_created.', :model => @score_evaluation.class.model_name.human) }
          format.json { render :json => @score_evaluation, :status => :created, :location => @score_evaluation }
          format.js
        else
          format.html { render :action => "new" }
          format.json { render :json => @score_evaluation.errors, :status => :unprocessable_entity }
          format.js
        end
      end
    end
  
    # PUT /score_evaluations/1
    # PUT /score_evaluations/1.json
    def update
      @score_evaluation = ScoreEvaluation.find(params[:id])
      params[:score_evaluation][:discipline_ids] ||= []
  
      respond_to do |format|
        if @score_evaluation.update_attributes(params[:score_evaluation])
          format.html { redirect_to @score_evaluation, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @score_evaluation.class.model_name.human) }
          format.json { head :no_content }
          format.js
        else
          format.html { render :action => "edit" }
          format.json { render :json => @score_evaluation.errors, :status => :unprocessable_entity }
          format.js
        end
      end
    end
  
    # DELETE /score_evaluations/1
    # DELETE /score_evaluations/1.json
    def destroy
      @score_evaluation = ScoreEvaluation.find(params[:id])
      @score_evaluation.destroy
  
      respond_to do |format|
        format.html { redirect_to score_evaluations_url }
        format.json { head :no_content }
        format.js
      end
    end
    
    private
    
    def resolve_layout
      case action_name
        when "index", "new", "show", "edit", "update"
          "selecao_admin/no_sidebar"
        else
          "selecao_admin/application"
      end          
    end    
    
  end
end
