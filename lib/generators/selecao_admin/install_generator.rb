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
            ### Instala gems de dependencia ###
            system "bundle"            
            
            ### Recupera as migrations da engine ###
            Dir.glob("engines/selecao_admin/db/migrate/*").sort_by{ |f| File.basename(f) }.each_with_index do |inm, index|
              engine_migrate_file = inm.split('/').last 
              engine_migrate = engine_migrate_file[15..engine_migrate_file.size].split('.')[0]        

              original_version = engine_migrate_file.split('_').first.to_s
              migrated_version = (migration_template "../../../db/migrate/#{engine_migrate_file}", "db/migrate/#{engine_migrate}.rb").split('/').last.split('_').first
                             
              IntegraEngineMigrated.create(:integra_engine_id => (IntegraEngine.where(:module_name => 'SelecaoAdmin').where(:display_name => 'Seleção Admin').first).id, :original_version => original_version, :migrated_version => migrated_version) if !IntegraEngineMigrated.find_by_original_version(original_version)
            end
            
            ### Nao migra o que ja foi migrado ###
            Dir.glob("engines/selecao_admin/db/migrate/*").sort_by{ |f| File.basename(f) }.each do |inm|
              migrated_version = IntegraEngineMigrated.where(:integra_engine_id => (IntegraEngine.where(:module_name => 'SelecaoAdmin').where(:display_name => 'Seleção Admin').first).id, :original_version => (inm.split('/').last).split('_').first.to_s).first.migrated_version
              if SchemaMigration.all.map {|sm| sm.version}.include?(migrated_version)
                FileUtils.rm(Dir.glob("db/migrate/*").select {|m| m.include?(inm.split('/').last[15..inm.size].split('.').first)})                
              end
            end             
            
            begin              
               Rake::Task['db:migrate'].reenable 
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