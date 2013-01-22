require_dependency "selecao_admin/application_controller"
include SelecaoAdmin::DrawingsHelper

module SelecaoAdmin
  class DrawingsController < ApplicationController
  
    layout 'selecao_admin/application'
    # GET /drawings
    # GET /drawings.json
    def index
      @drawings = Drawing.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @drawings }
      end
    end
  
    # GET /drawings/1
    # GET /drawings/1.json
    def show
      @drawing = Drawing.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @drawing }
      end
    end
  
    # GET /drawings/new
    # GET /drawings/new.json
    def new
      @drawing = Drawing.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @drawing }
      end
    end
  
    # GET /drawings/1/edit
    def edit
      @drawing = Drawing.find(params[:id])
    end
  
    # POST /drawings
    # POST /drawings.json
    def create
      @drawing = Drawing.new(params[:drawing])

      respond_to do |format|
        if @drawing.save
          format.html { redirect_to @drawing, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @drawing.class.model_name.human) }
          format.json { render :json => @drawing, :status => :created, :location => @drawing }
        else
          format.html { render :action => "new" }
          format.json { render :json => @drawing.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /drawings/1
    # PUT /drawings/1.json
    def update

      @drawing = Drawing.find(params[:id])
      SelecaoAdmin::DrawingStudentQuota.update(params[:drawing_student_quotas_attributes].keys, params[:drawing_student_quotas_attributes].values)
  
      respond_to do |format|
        if @drawing.update_attributes(params[:drawing])
          format.html { redirect_to @drawing, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @drawing.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @drawing.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /drawings/1
    # DELETE /drawings/1.json
    def destroy
      @drawing = Drawing.find(params[:id])
      @drawing.destroy
  
      respond_to do |format|
        format.html { redirect_to drawings_url }
        format.json { head :no_content }
      end
    end
    
    ####### Busca de reservas de vagas por inscrição #######
    def drawing_student_quotas
      @student_quotas = Enrollment.find(params[:enrollment_id]).student_quotas
      render :partial => "student_quotas", :object => @student_quotas
    end

    ####### Transfere vaga remanescente de reservas #######  
    def transfer_vacancy  
      @drawing = Drawing.find(params[:drawing_id])
        nr_inscritos = @drawing.enrollment.enrollment_enrolleds.where(:student_quota_id => params[:to_student_quota_id]).count 
        nr_vagas =  @drawing.drawing_student_quotas.where(:student_quota_id => params[:to_student_quota_id]).first.number_of_vacancies
        
        if nr_inscritos > nr_vagas
          from_drawing_student_quota = DrawingStudentQuota.where(:drawing_id => @drawing.id, :student_quota_id => params[:from_student_quota_id])
          from_drawing_student_quota.first.update_attributes(:number_of_vacancies => from_drawing_student_quota.first.number_of_vacancies - params[:vacancy_number].to_i)
          
          to_drawing_student_quota = DrawingStudentQuota.where(:drawing_id => @drawing.id, :student_quota_id => params[:to_student_quota_id])
          to_drawing_student_quota.first.update_attributes(:number_of_vacancies => to_drawing_student_quota.first.number_of_vacancies + params[:vacancy_number].to_i)
        end      
      respond_to do |format|
        format.js
      end      
    end
    
  end
end
