require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class EntryMailsController < ApplicationController
    # GET /entry_mails
    # GET /entry_mails.json
    def index
      @entry_mails = EntryMail.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @entry_mails }
      end
    end
  
    # GET /entry_mails/1
    # GET /entry_mails/1.json
    def show
      @entry_mail = EntryMail.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @entry_mail }
      end
    end
  
    # GET /entry_mails/new
    # GET /entry_mails/new.json
    def new
      @entry_mail = EntryMail.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @entry_mail }
      end
    end
  
    # GET /entry_mails/1/edit
    def edit
      @entry_mail = EntryMail.find(params[:id])
    end
  
    # POST /entry_mails
    # POST /entry_mails.json
    def create
      @entry_mail = EntryMail.new(params[:entry_mail])
  
      respond_to do |format|
        if @entry_mail.save
          format.html { redirect_to @entry_mail, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @entry_mail.class.model_name.human) }
          format.json { render :json => @entry_mail, :status => :created, :location => @entry_mail }
        else
          format.html { render :action => "new" }
          format.json { render :json => @entry_mail.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /entry_mails/1
    # PUT /entry_mails/1.json
    def update
      @entry_mail = EntryMail.find(params[:id])
  
      respond_to do |format|
        if @entry_mail.update_attributes(params[:entry_mail])
          format.html { redirect_to @entry_mail, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @entry_mail.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @entry_mail.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /entry_mails/1
    # DELETE /entry_mails/1.json
    def destroy
      @entry_mail = EntryMail.find(params[:id])
      @entry_mail.destroy
  
      respond_to do |format|
        format.html { redirect_to entry_mails_url }
        format.json { head :no_content }
      end
    end
  end
end
