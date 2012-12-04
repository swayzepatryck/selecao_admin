#######################
# Installer do plugin #
#######################
require 'securerandom'
require 'fileutils'
require 'rake'

Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
Integra::Application.load_tasks # providing your application name is 'sample'


module SelecaoAdmin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path("../../templates", __FILE__)

      # Descricao sumaria do que o generator faz
      desc "Instalador do módulo integra SelecaoAdmin"
      class_option :orm
      
      ### Configura as rotas da engine ###
      def add_selecao_admin_routes
        selecao_admin_route  = 'mount SelecaoAdmin::Engine, :at => "/selecao-admin"'
        route selecao_admin_route
      end     
            
      # Cadastra a Engine na base de dados. Necessário para controle de perfis e permissoes.
      def add_integra_engine
        if generating?
          IntegraEngine.create(:module_name => 'SelecaoAdmin', :display_name => 'Seleção Admin')
        elsif destroying?
          IntegraEngine.where(:module_name => 'SelecaoAdmin').where(:display_name => 'Seleção Admin').first.destroy
        end
      end

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
          @prev_migration_nr.to_s
      end
      
      def install_migration
         if generating?               
            ### Instala gems necessarias descritas no Gemfile ###
            system "bundle"
                        
            ### Recupera as migrations da engine ###
            Dir.glob("engines/selecao_admin/db/migrate/*").sort_by{ |f| File.basename(f) }.each do |inm|
              engine_migrate_file = inm.split('/').last 
              engine_migrate = engine_migrate_file[15..engine_migrate_file.size].split('.')[0]                 

              migration_template "../../../db/migrate/#{engine_migrate_file}", "db/migrate/#{engine_migrate}.rb"                                 
            end
            
            begin  
               Rake::Task['db:migrate'].reenable # in case you're going to invoke the same task second time.
               Rake::Task['db:migrate'].invoke  
               
               Dir.glob("engines/selecao_admin/db/migrate/*").sort_by{ |f| File.basename(f) }.each do |inm|
                 Dir.glob("db/migrate/*").sort_by{ |f| File.mtime(f) }.each do |im|
                   if im.include?(inm.split('/')[4][15..inm.size].split('.')[0].to_s)
                     FileUtils.rm(im)
                   end
                 end
               end                                            
               
               puts "\n\n"
               readme "README"                   
            rescue Exception => msg  
               puts "\n\nHouve um erro: \n\n#{msg}"
               Dir.glob("engines/selecao_admin/db/migrate/*").sort_by{ |f| File.basename(f) }.each do |inm|
                 Dir.glob("db/migrate/*").sort_by{ |f| File.mtime(f) }.each do |im|
                   if im.include?(inm.split('/')[4][15..inm.size].split('.')[0].to_s)
                     FileUtils.rm(im)
                   end
                 end
               end                             
            end
                   
         elsif destroying?
           puts "\n\n"
           readme "README_DESTROYING"                                    
         end
      end
  
      protected     
            
      def generating?
         :invoke == behavior
      end

      def destroying?
         :revoke == behavior
      end       
    end
  end
end
