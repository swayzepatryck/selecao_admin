module SelecaoAdmin
  class EnrolledsDatatable
    delegate :params, :h, :link_to, :number_to_currency, :to => :@view

    def initialize(view)
      @view = view
    end

    def as_json(options = {})
      {
        :sEcho => params[:sEcho].to_i,
        :iTotalRecords => SelecaoAdmin::Enrolled.count,
        :iTotalDisplayRecords => enrolleds.count,
        :aaData => data
      }
    end

    private

    def data
      enrolleds.map do |enrolled|
        [ 
          link_to(enrolled.id, enrolled), 
          link_to(enrolled.user.name, enrolled), 
          enrolled.user.login          
        ]
      end
    end    

    def enrolleds
      @enrolleds ||= fetch_enrolleds
    end

    def fetch_enrolleds
      enrolleds =  SelecaoAdmin::Enrolled.joins(:user).order("#{sort_column} #{sort_direction}")
      if params[:sSearch].present?
        enrolleds =  SelecaoAdmin::Enrolled.joins(:user).where('(TRANSLATE(lower(users.name), \'áéíóúàèìòùãõâêîôôäëïöüçÁÉÍÓÚÀÈÌÒÙÃÕÂÊÎÔÛÄËÏÖÜÇ\', \'aeiouaeiouaoaeiooaeioucAEIOUAEIOUAOAEIOOAEIOUC\')) like ? or login like ?',"%#{params[:sSearch].downcase}%","%#{params[:sSearch].downcase}%").order("#{sort_column} #{sort_direction}")
      end
      enrolleds = enrolleds.page(page).per_page(per_page)      
      enrolleds
    end

    def page
      params[:iDisplayStart].to_i/per_page + 1
    end

    def per_page
      params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
    end

    def sort_column
      columns = %w[id (TRANSLATE(users.name,\ 'áéíóúàèìòùãõâêîôôäëïöüçÁÉÍÓÚÀÈÌÒÙÃÕÂÊÎÔÛÄËÏÖÜÇ',\ 'aeiouaeiouaoaeiooaeioucAEIOUAEIOUAOAEIOOAEIOUC')) users.login]
      #columns = %w[id]
      columns[params[:iSortCol_0].to_i]
    end

    def sort_direction
      params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end
  end
end