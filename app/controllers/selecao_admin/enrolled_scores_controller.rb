require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class EnrolledScoresController < ApplicationController
    # GET /enrolled_scores
    # GET /enrolled_scores.json
    def index
      @enrolled_scores = EnrolledScore.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @enrolled_scores }
      end
    end
  
    # GET /enrolled_scores/1
    # GET /enrolled_scores/1.json
    def show
      @enrolled_score = EnrolledScore.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @enrolled_score }
      end
    end
  
    # GET /enrolled_scores/new
    # GET /enrolled_scores/new.json
    def new
      @enrolled_score = EnrolledScore.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @enrolled_score }
      end
    end
  
    # GET /enrolled_scores/1/edit
    def edit
      @enrolled_score = EnrolledScore.find(params[:id])
    end
  
    # POST /enrolled_scores
    # POST /enrolled_scores.json
    def create
      @enrolled_score = EnrolledScore.new(params[:enrolled_score])
  
      respond_to do |format|
        if @enrolled_score.save
          format.html { redirect_to @enrolled_score, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @enrolled_score.class.model_name.human) }
          format.json { render :json => @enrolled_score, :status => :created, :location => @enrolled_score }
        else
          format.html { render :action => "new" }
          format.json { render :json => @enrolled_score.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /enrolled_scores/1
    # PUT /enrolled_scores/1.json
    def update
      @enrolled_score = EnrolledScore.find(params[:id])
  
      respond_to do |format|
        if @enrolled_score.update_attributes(params[:enrolled_score])
          format.html { redirect_to @enrolled_score, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @enrolled_score.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @enrolled_score.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /enrolled_scores/1
    # DELETE /enrolled_scores/1.json
    def destroy
      @enrolled_score = EnrolledScore.find(params[:id])
      @enrolled_score.destroy
  
      respond_to do |format|
        format.html { redirect_to enrolled_scores_url }
        format.json { head :no_content }
      end
    end
  end
end
