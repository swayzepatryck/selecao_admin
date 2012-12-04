require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class OnlineLectureCodesController < ApplicationController
    # GET /online_lecture_codes
    # GET /online_lecture_codes.json
    def index
      @online_lecture_codes = OnlineLectureCode.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @online_lecture_codes }
      end
    end
  
    # GET /online_lecture_codes/1
    # GET /online_lecture_codes/1.json
    def show
      @online_lecture_code = OnlineLectureCode.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @online_lecture_code }
      end
    end
  
    # GET /online_lecture_codes/new
    # GET /online_lecture_codes/new.json
    def new
      @online_lecture_code = OnlineLectureCode.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @online_lecture_code }
      end
    end
  
    # GET /online_lecture_codes/1/edit
    def edit
      @online_lecture_code = OnlineLectureCode.find(params[:id])
    end
  
    # POST /online_lecture_codes
    # POST /online_lecture_codes.json
    def create
      @online_lecture_code = OnlineLectureCode.new(params[:online_lecture_code])
  
      respond_to do |format|
        if @online_lecture_code.save
          format.html { redirect_to @online_lecture_code, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @online_lecture_code.class.model_name.human) }
          format.json { render :json => @online_lecture_code, :status => :created, :location => @online_lecture_code }
        else
          format.html { render :action => "new" }
          format.json { render :json => @online_lecture_code.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /online_lecture_codes/1
    # PUT /online_lecture_codes/1.json
    def update
      @online_lecture_code = OnlineLectureCode.find(params[:id])
  
      respond_to do |format|
        if @online_lecture_code.update_attributes(params[:online_lecture_code])
          format.html { redirect_to @online_lecture_code, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @online_lecture_code.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @online_lecture_code.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /online_lecture_codes/1
    # DELETE /online_lecture_codes/1.json
    def destroy
      @online_lecture_code = OnlineLectureCode.find(params[:id])
      @online_lecture_code.destroy
  
      respond_to do |format|
        format.html { redirect_to online_lecture_codes_url }
        format.json { head :no_content }
      end
    end
  end
end
