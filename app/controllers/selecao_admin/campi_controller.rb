require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class CampiController < ApplicationController
    layout :resolve_layout
    # GET /campi
    # GET /campi.json
    def index
      @campi = Campus.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @campi }
        format.pdf do 
          pdf = NumberOfSubscribersPdf.new(:subscribers => Campus.order(:name))
          send_data pdf.render, :filename => "Campus x Nº de Inscritos #{Time.now}", :type => "application/pdf", :disposition => "inline"
        end
      end
    end
  
    # GET /campi/1
    # GET /campi/1.json
    def show
      @campus = Campus.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @campus }
      end
    end
  
    # GET /campi/new
    # GET /campi/new.json
    def new
      @campus = Campus.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @campus }
      end
    end
  
    # GET /campi/1/edit
    def edit
      @campus = Campus.find(params[:id])
    end
  
    # POST /campi
    # POST /campi.json
    def create
      @campus = Campus.new(params[:campus])
  
      respond_to do |format|
        if @campus.save
          format.html { redirect_to @campus, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @campus.class.model_name.human) }
          format.json { render :json => @campus, :status => :created, :location => @campus }
        else
          format.html { render :action => "new" }
          format.json { render :json => @campus.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /campi/1
    # PUT /campi/1.json
    def update
      @campus = Campus.find(params[:id])
  
      respond_to do |format|
        if @campus.update_attributes(params[:campus])
          format.html { redirect_to @campus, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @campus.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @campus.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /campi/1
    # DELETE /campi/1.json
    def destroy
      @campus = Campus.find(params[:id])
      @campus.destroy
  
      respond_to do |format|
        format.html { redirect_to campi_url }
        format.json { head :no_content }
        format.js
      end
    end
    
    private
    
    def resolve_layout
      #case action_name
      #  when "index"
          "selecao_admin/no_sidebar"
      #  else
      #    "selecao_admin/application"
      #end          
    end    
    
  end
end
