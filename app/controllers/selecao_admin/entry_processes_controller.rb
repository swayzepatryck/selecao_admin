require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class EntryProcessesController < ApplicationController
    layout :resolve_layout
    # GET /entry_processes
    # GET /entry_processes.json
    def index
      @entry_processes = EntryProcess.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @entry_processes }
        
      end
    end
  
    # GET /entry_processes/1
    # GET /entry_processes/1.json
    def show
      @entry_process = EntryProcess.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @entry_process }
      end
    end
  
    # GET /entry_processes/new
    # GET /entry_processes/new.json
    def new
      @entry_process = EntryProcess.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @entry_process }
      end
    end
  
    # GET /entry_processes/1/edit
    def edit
      @entry_process = EntryProcess.find(params[:id])
      
      respond_to do |format|
         format.html # new.html.erb
         format.js
     end      
    end
  
    # POST /entry_processes
    # POST /entry_processes.json
    def create
      @entry_process = EntryProcess.new(params[:entry_process])
  
      respond_to do |format|
        if @entry_process.save
          format.html { redirect_to @entry_process, :notice => t('selecao_admin.flash_messages.successfully_created', :model => @entry_process.class.model_name.human) }
          format.json { render :json => @entry_process, :status => :created, :location => @entry_process }
          format.js
        else
          format.html { render :action => "new" }
          format.json { render :json => @entry_process.errors, :status => :unprocessable_entity }
          
        end
      end
    end
  
    # PUT /entry_processes/1
    # PUT /entry_processes/1.json
    def update
      @entry_process = EntryProcess.find(params[:id])
      params[:entry_process][:student_quota_ids] ||= []
      params[:entry_process][:score_evaluation_ids] ||= []
  
      respond_to do |format|
        if @entry_process.update_attributes(params[:entry_process])
          format.html { redirect_to @entry_process, :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @entry_process.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @entry_process.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /entry_processes/1
    # DELETE /entry_processes/1.json
    def destroy
      @entry_process = EntryProcess.find(params[:id])
      @entry_process.destroy
  
      respond_to do |format|
        format.html { redirect_to entry_processes_url }
        format.json { head :no_content }
        format.js
      end
    end
    
    def json_entry_process_mode
      @entry_process_mode = SelecaoAdmin::EntryProcess.find(params[:id]).entry_process_mode
      @result = Hash.new
      @result[:entry_process_mode] = @entry_process_mode
      
      respond_to do |format|
         format.html
         format.json { render :json => @result }
      end      
    end
    
    private
    
    def resolve_layout
      #case action_name
        #when "index", "create", "new", "edit", "update"
        #  "selecao_admin/application"
        #else
          "selecao_admin/no_sidebar"
      #end          
    end    
  end
end
