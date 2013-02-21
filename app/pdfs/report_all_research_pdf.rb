class ReportAllResearchPdf < Prawn::Document
  def initialize(params)
    @survey_id = params[:survey_id]
     super(:top_margin => 110, :page_layout => :landscape, :pagesize => "A4")
    #super()
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
     draw_text [[I18n.t('selecao_admin.links.enrollments.research_report'), I18n.t('selecao_admin.links.enrollments.title_search')]], :at => [120, 520], :style => :bold
     
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
    bounding_box ([80, 470], :width => 2200) do 
      #@title_option_count = [I18n.t('activerecord.attributes.selecao_admin/pdfs.research_report'), I18n.t('activerecord.attributes.selecao_admin/pdfs.title_search')]
      option_by_question = nil
      option_by_question = SelecaoAdmin::Enrollment.new.report_all_research(@survey_id).group_by { |p| p.question.to_s }
      option_by_question.keys.sort.each_with_index do |question,indice|
        text "#{indice + 1}. #{question }"
        text " "
        tabela = [["Opção", "Quantidade"]]
          
        option_by_question[question].each do |option|
          tabela << ["#{option.option}", "#{option.count}"]
        end
          
        table(tabela, :header => { :background_color => 'CC0000', :font_style => :bold, :colspan => 2 }, :row_colors => ["CCCCCC", "FFFFFF"]) do
          columns(0).width = 500
          #rows(0).borders = []
        end
        
        move_down(20)
        
        #table([ ["A", {:content => "2x1", :colspan => 2}, "B"], [{:content => "1x2", :rowspan => 2}, "C", "D", "E"], [{:content => "2x2", :colspan => 2, :rowspan => 2}, "F"], ["G", "H"]])
        
        
        # option_by_question = dado.option.group_by {|p| p.to_s}
        # option_by_question.keys.sort.each do |question|
          # tabela << ["#{question}"] 
          # option_by_question[question].each do |option|
            # option
          # end  
        # end  
       # tabela << ["#{dado.question}"]
       # dado.question.option.each
       # data.option.questions.each do |question|
       #   tabela << ["#{question}"]
       # end
      end 
      
      # table(tabela, :header => true, :row_colors => ["CCCCCC", "FFFFFF"]) do
        # columns(0).width = 100
      # end
    end
  end
end