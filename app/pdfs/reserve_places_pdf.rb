class ReservePlacesPdf < Prawn::Document
  def initialize(params)
     super(:top_margin => 110, :page_layout => :landscape, :pagesize => "A4")
    #super()
    @reserve_places = params[:reserve_places]
    #header
    repeat(:all) do
      title
      stroke_horizontal_line 0, 720, :at => 485
      logo
    end
    corpo
    foot
  end
  
  def title
     font_size 24
     draw_text [[I18n.t('selecao_admin.links.student_quota.reserve_report'), I18n.t('selecao_admin.links.student_quota.number_of_subscribers')]], :at => [150, 520], :style => :bold
     
  end
  
  def foot
      page_count.times do |i|
      go_to_page(i+1)
      # draw_text "Brasília, #{I18n.l Time.now, :format => '%d de %B de %Y'}", :at => [10, -10]     
      #draw_text "ACADEMICO - IFB", :at => [350, -10], :style => :bold
      draw_text "Página #{i+1} de #{page_count}", :at => [645, -10]
    end
  end
  
  def logo
    image "engines/selecao_admin/app/assets/images/selecao_admin/logo-if.png", :at => [0,570], :width => 55, :height => 70
    
  end
  
  def corpo
    font_size 12
    tabela = [[I18n.t('activerecord.attributes.selecao_admin/pdfs.number_of_subscribers'), I18n.t('activerecord.attributes.selecao_admin/pdfs.full_number')]]
    SelecaoAdmin::EnrollmentEnrolled.new.number_of_quotas.each do |dado|
      tabela << ["#{dado.title}", "#{dado.count}"]
    end 
    
    table(tabela, :header => true, :row_colors => ["CCCCCC", "FFFFFF"])
  end
end