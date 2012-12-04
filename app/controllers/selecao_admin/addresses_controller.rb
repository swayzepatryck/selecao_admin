require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class AddressesController < ApplicationController
    layout 'selecao_admin/no_sidebar'
    # GET /addresses
    # GET /addresses.json
    def index
      @addresses = Address.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @addresses }
      end
    end
  
    # GET /addresses/1
    # GET /addresses/1.json
    def show
      @address = Address.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @address }
      end
    end
  
    # GET /addresses/new
    # GET /addresses/new.json
    def new
      @address = Address.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @address }
      end
    end
  
    # GET /addresses/1/edit
    def edit
      @address = Address.find(params[:id])
    end
  
    # POST /addresses
    # POST /addresses.json
    def create
      @address = Address.new(params[:address])
  
      respond_to do |format|
        if @address.save
          format.html { redirect_to @address, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @address.class.model_name.human) }
          format.json { render :json => @address, :status => :created, :location => @address }
          format.js
        else
          format.html { render :action => "new" }
          format.json { render :json => @address.errors, :status => :unprocessable_entity }
          format.js
        end
      end
    end
  
    # PUT /addresses/1
    # PUT /addresses/1.json
    def update
      @address = Address.find(params[:id])
  
      respond_to do |format|
        if @address.update_attributes(params[:address])
          format.html { redirect_to @address, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @address.class.model_name.human) }
          format.json { head :no_content }
          format.js
        else
          format.html { render :action => "edit" }
          format.json { render :json => @address.errors, :status => :unprocessable_entity }
          format.js
        end
      end
    end
  
    # DELETE /addresses/1
    # DELETE /addresses/1.json
    def destroy
      @address = Address.find(params[:id])
      @address.destroy
  
      respond_to do |format|
        format.html { redirect_to addresses_url }
        format.json { head :no_content }
        format.js
      end
    end
  end
end
