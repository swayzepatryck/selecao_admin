require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class EntryMailTypesController < ApplicationController
    # GET /entry_mail_types
    # GET /entry_mail_types.json
    def index
      @entry_mail_types = EntryMailType.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @entry_mail_types }
      end
    end
  
    # GET /entry_mail_types/1
    # GET /entry_mail_types/1.json
    def show
      @entry_mail_type = EntryMailType.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @entry_mail_type }
      end
    end
  
    # GET /entry_mail_types/new
    # GET /entry_mail_types/new.json
    def new
      @entry_mail_type = EntryMailType.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @entry_mail_type }
      end
    end
  
    # GET /entry_mail_types/1/edit
    def edit
      @entry_mail_type = EntryMailType.find(params[:id])
    end
  
    # POST /entry_mail_types
    # POST /entry_mail_types.json
    def create
      @entry_mail_type = EntryMailType.new(params[:entry_mail_type])
  
      respond_to do |format|
        if @entry_mail_type.save
          format.html { redirect_to @entry_mail_type, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @entry_mail_type.class.model_name.human) }
          format.json { render :json => @entry_mail_type, :status => :created, :location => @entry_mail_type }
        else
          format.html { render :action => "new" }
          format.json { render :json => @entry_mail_type.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /entry_mail_types/1
    # PUT /entry_mail_types/1.json
    def update
      @entry_mail_type = EntryMailType.find(params[:id])
  
      respond_to do |format|
        if @entry_mail_type.update_attributes(params[:entry_mail_type])
          format.html { redirect_to @entry_mail_type, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @entry_mail_type.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @entry_mail_type.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /entry_mail_types/1
    # DELETE /entry_mail_types/1.json
    def destroy
      @entry_mail_type = EntryMailType.find(params[:id])
      @entry_mail_type.destroy
  
      respond_to do |format|
        format.html { redirect_to entry_mail_types_url }
        format.json { head :no_content }
      end
    end
  end
end
