$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "selecao_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "selecao_admin"
  s.version     = SelecaoAdmin::VERSION
  s.authors     = ["Renato de Souza"]
  s.email       = ["renato.souza@ifb.edu.br"]
  s.homepage    = "http://www.ifb.edu.br"
  s.summary     = "Seleção Admin - Gerenciador de Seleção do Instituto Federal de Brasília."
  s.description = "Seleção Admin - Gerenciador de Seleção do Instituto Federal de Brasília."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "3.2.7"
  s.add_dependency "pg", "0.14.0"  
end
