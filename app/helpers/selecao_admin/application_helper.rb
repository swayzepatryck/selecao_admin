module SelecaoAdmin
  module ApplicationHelper
    
    #### Icone de editar #####
    def edit_icon
      "<i class='icon-edit'></i>".html_safe
    end
    
    def destroy_icon
      "<i class='icon-trash'></i>".html_safe
    end
    
    
    ######### belongs_to_menu methods ############
    @@views_path = Dir.glob("**/*/*").delete_if{|x| !x.include?('views')}
    
		def get_path_parameters
		  path_array = Array.new
      (SelecaoAdmin::Engine.routes.recognize_path request.env['PATH_INFO']).each{|key,value|  
        if key != :controller and key != :action
            path_array << value
        end
      }
      path_array
	  end		
		
		def detect_current_path(path)
		  current_path = SelecaoAdmin::Engine.routes.recognize_path request.env['PATH_INFO']
		  given_path = SelecaoAdmin::Engine.routes.recognize_path path.gsub(get_engine_path_prefix,"")		  
      current_path[:controller] == given_path[:controller] and return true else return false
	  end
		
		def get_engine_path_prefix
      "/".concat(request.env['REQUEST_URI'].gsub(request.env['PATH_INFO'], "").split('/').last)
    end		
    
    def get_model_belongs_to(menu_model_name)	
      belongs_to_menu = menu_model_name.reflect_on_all_associations(:belongs_to).map(&:name).delete_if {|bt| request.env['PATH_INFO'].split("/").include?(bt.to_s.pluralize) or !view_exists?(bt)}			  		  	      			
    end
    
    def view_exists?(bt)
      file_exists = false
      @@views_path.each do |d|
        if d.include?(bt.to_s.pluralize.concat("/index.html.erb"))          
    	    file_exists = true
        end
     end 		 
     file_exists
    end
    
    def classify_relation_name(relation_name)    
      if controller_path.split('/').size >= 2
        relation_name_classified = controller_path.split('/').first.classify.concat("::").concat(relation_name.to_s.camelize).constantize  
      else
        relation_name.to_s.camelize
      end 
    end
    
    
    def translate_relation_name(relation_name)    
      if controller_path.split('/').size >= 2
        relation_name_classified = controller_path.split('/').first.classify.concat("::").concat(relation_name.to_s.camelize).constantize.model_name.human  
      else
        relation_name.to_s.camelize.model_name.human
      end 
    end
    ########### ./belongs_to_menu methods #############
                
    ########### restrict_dependecies methods ########
    def any_restrict_dependecy?(model_object) 
      dependecie_models = Array.new
      model_object.class.reflect_on_all_associations(:has_many).each do |hm| 
         if model_object.method(hm.name.to_sym).call.any? and hm.options[:dependent] == :restrict
           model_object.method(hm.name.to_sym).call.each do |d|
             dependecie_models << " ".concat(d.class.to_s.constantize.model_name.human.pluralize) unless dependecie_models.include?(" ".concat(d.class.to_s.constantize.model_name.human.pluralize))          
           end
           return dependecie_models
         end
      end     
      false
    end   
    ########### ./restrict_dependecies methods ########
    
    ########### Prevent blank object showing #########
    def c(object)
      object.blank? ? "<<#{t('general.no_record_found')}>>" : object
    end
    
    def ct(dt, hash = {})
      dt ? l(dt, hash) : "<<#{t('general.no_record_found')}>>"
    end
    ########## ./Prevent blank object showing #######
    
    
    ######### ryan bates nested forms #########
    def link_to_add_fields(name, f, association)
      new_object = f.object.send(association).klass.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, :child_index => id) do |builder|
        render(association.to_s.singularize + "_fields", :f => builder)
      end
      link_to(name, '#', :class => "add_fields btn", :data => {:id => id, :fields => fields.gsub("\n", "")}) 
    end
    ######### ./ryan bates nested forms #########
    
    
    ######## rack para corrigir validacao de campos com chosen jquery ######
    def show_multiple_error_messages(f, field)
      if f.object.errors[field].any? 
  		  label_tag f.object.errors[:"#{field}"], nil, :class => 'message' 
  	  end 			
    end
    
  end
end