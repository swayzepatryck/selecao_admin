require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class PublicationCategoriesController < ApplicationController
    # GET /publication_categories
    # GET /publication_categories.json
    def index
      @publication_categories = PublicationCategory.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @publication_categories }
      end
    end
  
    # GET /publication_categories/1
    # GET /publication_categories/1.json
    def show
      @publication_category = PublicationCategory.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @publication_category }
      end
    end
  
    # GET /publication_categories/new
    # GET /publication_categories/new.json
    def new
      @publication_category = PublicationCategory.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @publication_category }
      end
    end
  
    # GET /publication_categories/1/edit
    def edit
      @publication_category = PublicationCategory.find(params[:id])
    end
  
    # POST /publication_categories
    # POST /publication_categories.json
    def create
      @publication_category = PublicationCategory.new(params[:publication_category])
  
      respond_to do |format|
        if @publication_category.save
          format.html { redirect_to @publication_category, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @publication_category.class.model_name.human) }
          format.json { render :json => @publication_category, :status => :created, :location => @publication_category }
        else
          format.html { render :action => "new" }
          format.json { render :json => @publication_category.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /publication_categories/1
    # PUT /publication_categories/1.json
    def update
      @publication_category = PublicationCategory.find(params[:id])
  
      respond_to do |format|
        if @publication_category.update_attributes(params[:publication_category])
          format.html { redirect_to @publication_category, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @publication_category.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @publication_category.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /publication_categories/1
    # DELETE /publication_categories/1.json
    def destroy
      @publication_category = PublicationCategory.find(params[:id])
      @publication_category.destroy
  
      respond_to do |format|
        format.html { redirect_to publication_categories_url }
        format.json { head :no_content }
      end
    end
  end
end
