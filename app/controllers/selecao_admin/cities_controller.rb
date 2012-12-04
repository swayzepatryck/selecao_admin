require_dependency "selecao_admin/application_controller"

module SelecaoAdmin
  class CitiesController < ApplicationController
    def index
      @cities = City.find_by_sql("SELECT c.id, c.name || ' - ' || s.code as \"text\" FROM selecao_admin_cities c, selecao_admin_states s WHERE c.state_id = s.id and (TRANSLATE(lower(c.name), 'áéíóúàèìòùãõâêîôôäëïöüçÁÉÍÓÚÀÈÌÒÙÃÕÂÊÎÔÛÄËÏÖÜÇ', 'aeiouaeiouaoaeiooaeioucAEIOUAEIOUAOAEIOOAEIOUC') like '%#{params[:term].downcase}%' or lower(c.name) like '%#{params[:term].downcase}%')")      
      @results = Hash.new
      @results[:results] = @cities
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @results}
      end
    end
  end
end

