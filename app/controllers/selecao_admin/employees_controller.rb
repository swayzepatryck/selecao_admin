module SelecaoAdmin
  class EmployeesController < ApplicationController
    def index
      @employees = User.find_by_sql("SELECT u.id, u.name as \"text\" FROM users u WHERE employee = true and (TRANSLATE(lower(u.name), 'áéíóúàèìòùãõâêîôôäëïöüçÁÉÍÓÚÀÈÌÒÙÃÕÂÊÎÔÛÄËÏÖÜÇ', 'aeiouaeiouaoaeiooaeioucAEIOUAEIOUAOAEIOOAEIOUC') like '%#{params[:term].downcase}%' or lower(u.name) like '%#{params[:term].downcase}%')")      
      @results = Hash.new
      @results[:results] = @employees
      
      respond_to do |format|
        format.json { render :json => @results }
      end    
    end
  end
end