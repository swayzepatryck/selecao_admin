require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class AnnouncementsController < ApplicationController
    layout :resolve_layout
    # GET /announcements
    # GET /announcements.json
    def index
      @announcements = Announcement.all(:order => 'publication_date')
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @announcements }
      end
    end
  
    # GET /announcements/1
    # GET /announcements/1.json
    def show
      @announcement = Announcement.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @announcement }
      end
    end
  
    # GET /announcements/new
    # GET /announcements/new.json
    def new
      @announcement = Announcement.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @announcement }
      end
    end
  
    # GET /announcements/1/edit
    def edit
      @announcement = Announcement.find(params[:id])
    end
  
    # POST /announcements
    # POST /announcements.json
    def create
      @announcement = Announcement.new(params[:announcement])
  
      respond_to do |format|
        if @announcement.save
          format.html { redirect_to @announcement, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @announcement.class.model_name.human) }
          format.json { render :json => @announcement, :status => :created, :location => @announcement }
          format.js
        else
          format.html { render :action => "new" }
          format.json { render :json => @announcement.errors, :status => :unprocessable_entity }
          format.js
        end
      end
    end
  
    # PUT /announcements/1
    # PUT /announcements/1.json
    def update
      @announcement = Announcement.find(params[:id])
  
      respond_to do |format|
        if @announcement.update_attributes(params[:announcement])
          format.html { redirect_to @announcement, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @announcement.class.model_name.human) }
          format.json { head :no_content }
          format.js
        else
          format.html { render :action => "edit" }
          format.json { render :json => @announcement.errors, :status => :unprocessable_entity }
          format.js
        end
      end
    end
  
    # DELETE /announcements/1
    # DELETE /announcements/1.json
    def destroy
      @announcement = Announcement.find(params[:id])
      @announcement.destroy
  
      respond_to do |format|
        format.html { redirect_to announcements_url }
        format.json { head :no_content }
        format.js
      end
    end  
    
    private
    
    def resolve_layout
      case action_name
        when "index"
          "selecao_admin/no_sidebar"
        else
          "selecao_admin/application"
      end     
    end
     
  end
end
