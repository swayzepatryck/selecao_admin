require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class EnrollmentsController < ApplicationController
    layout :resolve_layout
    # GET /enrollments
    # GET /enrollments.json
    def index
      @enrollments = Enrollment.where(:announcement_id => params[:announcement_id])
  
      respond_to do |format|
        format.html # index.html.erb
        format.csv { render :text => @enrollments.to_csv }
        format.json { render :json => @enrollments }
      end
    end
  
    # GET /enrollments/1
    # GET /enrollments/1.json
    def show
      @enrollment = Enrollment.find(params[:id])
      @enrollment_csv = Enrollment.where(:id => params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.csv { render :text => @enrollment_csv.to_csv(params[:score_evaluation_id]) }        
        format.json { render :json => @enrollment }
      end
    end
  
    # GET /enrollments/new
    # GET /enrollments/new.json
    def new
      @enrollment = Enrollment.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @enrollment }
      end
    end
  
    # GET /enrollments/1/edit
    def edit
      @enrollment = Enrollment.find(params[:id])
    end
  
    # POST /enrollments
    # POST /enrollments.json
    def create
      @enrollment = Enrollment.new(params[:enrollment])
      @enrollment.build_drawing
  
      respond_to do |format|
        if @enrollment.save
          format.html { redirect_to announcement_enrollment_path(@enrollment.announcement, @enrollment), :notice => t('selecao_admin.flash_messages.successfully_created', :model => @enrollment.class.model_name.human) }
          format.json { render :json => @enrollment, :status => :created, :location => @enrollment }
        else
          format.html { render :action => "new" }
          format.json { render :json => @enrollment.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /enrollments/1
    # PUT /enrollments/1.json
    def update
      @enrollment = Enrollment.find(params[:id])
  
      respond_to do |format|
        if @enrollment.update_attributes(params[:enrollment])
          format.html { redirect_to announcement_enrollment_path(@enrollment.announcement, @enrollment), :notice => t('selecao_admin.flash_messages.successfully_updated', :model => @enrollment.class.model_name.human) }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @enrollment.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /enrollments/1
    # DELETE /enrollments/1.json
    def destroy
      if params[:score_evaluation_id]
        EnrolledScore.where(:enrollment_id => params[:id]).where(:score_evaluation_id => params[:score_evaluation_id]).delete_all
        redirect_to announcement_enrollment_path(params[:announcement_id],request.referrer.split('/').last), :notice => "Notas excluidas com sucesso"
        
      else
        @enrollment = Enrollment.find(params[:id])
        @enrollment.destroy        
        
        respond_to do |format|
          format.html { redirect_to announcement_enrollments_url }
          format.json { head :no_content }
          format.js
        end        
      end      
    end
    
    def import_scores
      Enrollment.import_scores(params[:file], params[:score_evaluation_id], request.referrer.split('/').last)
      redirect_to announcement_enrollment_path(params[:announcement_id],request.referrer.split('/').last), :notice => "Notas importadas com sucesso."
    end
    
    def enrolleds
      @enrolleds = SelecaoAdmin::EnrollmentEnrolled.where(:enrollment_id => params[:enrollment_id]).map {|ee| "<td>#{ee.enrolled.user.login}</td><td>#{ee.enrolled.user.name}</td><td>#{ee.enrolled.user.email}</td><td><ul>#{ee.enrolled.phones.map{|p| '<li>(' + p.prefix + ') ' + p.suffix + '</li>'}}</ul></td><td>#{ee.enrollment.course.name}</td><td>#{ee.student_quota.title}</td>"}
      
      respond_to do |format|
        format.json { render :json => @enrolleds }        
      end
    end
    
    
    private
    
    def resolve_layout
      case action_name
        when "index", "create", "new", "edit", "update"
          "selecao_admin/application"
        else
          "selecao_admin/no_sidebar"
      end          
    end    
    
  end
end
