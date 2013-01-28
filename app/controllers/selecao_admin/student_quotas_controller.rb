require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class StudentQuotasController < ApplicationController
    layout 'selecao_admin/no_sidebar'
    # GET /student_quotas
    # GET /student_quotas.json
    def index
      @student_quotas = StudentQuota.order(:id)
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @student_quotas }
        format.pdf do 
          pdf = ReservePlacesPdf.new(:reserve_places => @student_quota)
          send_data pdf.render, :filename => "Relatorio reserva x Nº de inscritos #{Time.now}", :type => "application/pdf", :disposition => "inline"
        end
      end
    end
  
    # GET /student_quotas/1
    # GET /student_quotas/1.json
    def show
      @student_quota = StudentQuota.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @student_quota }
      end
    end
  
    # GET /student_quotas/new
    # GET /student_quotas/new.json
    def new
      @student_quota = StudentQuota.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @student_quota }
      end
    end
  
    # GET /student_quotas/1/edit
    def edit
      @student_quota = StudentQuota.find(params[:id])    
    end
  
    # POST /student_quotas
    # POST /student_quotas.json
    def create
      @student_quota = StudentQuota.new(params[:student_quota])
  
      respond_to do |format|
        if @student_quota.save
          format.html { redirect_to @student_quota, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @student_quota.class.model_name.human) }
          format.json { render :json => @student_quota, :status => :created, :location => @student_quota }
          format.js
        else
          format.html { render :action => "new" }
          format.json { render :json => @student_quota.errors, :status => :unprocessable_entity }
          format.js          
        end
      end
    end
  
    # PUT /student_quotas/1
    # PUT /student_quotas/1.json
    def update
      @student_quota = StudentQuota.find(params[:id])
  
      respond_to do |format|
        if @student_quota.update_attributes(params[:student_quota])
          format.html { redirect_to @student_quota, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @student_quota.class.model_name.human) }
          format.json { head :no_content }
          format.js
        else
          format.html { render :action => "edit" }
          format.json { render :json => @student_quota.errors, :status => :unprocessable_entity }
          format.js
        end
      end
    end
  
    # DELETE /student_quotas/1
    # DELETE /student_quotas/1.json
    def destroy
      @student_quota = StudentQuota.find(params[:id])
      @student_quota.destroy
  
      respond_to do |format|
        format.html { redirect_to student_quotas_url }
        format.json { head :no_content }
        format.js        
      end
    end
  end
end
