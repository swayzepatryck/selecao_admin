require "selecao_admin/engine"

module SelecaoAdmin
  # Flag para engines Integra.
  mattr_accessor :integra_engine
  @@integra_engine = true
  
  # Flag que seta a engine como publica, pulando as autorizações na hora de exibir na pagina inicial do integra.
  # Se for publica, setar como true. Se não for pública, setar como false.
  mattr_accessor :public_engine
  @@public_engine = true

  # Título da engine que é mostrado na página inicial do Integra. MAX: 24 Caracteres
  mattr_accessor :title
  @@title = "Seleção Admin"

  # Descrição da engine que é mostrada na página inicial do Integra. MAX: 100 Caracteres
  mattr_accessor :description 
  @@description = "O Seleção Admin é gerenciador de seleção do Instituto Federal de Brasília." 

  # Rota para a engine no integra
  mattr_accessor :path 
  @@path = "/selecao-admin"

  # Cor de fundo da caixa da engine na pagina inicial do integra
  mattr_accessor :well_background
  @@well_background = "#c1e600"

  # Icone da Engine - Font Awesome
  mattr_accessor :engine_icon_class
  @@engine_icon_class = "icon-signin"    
end
