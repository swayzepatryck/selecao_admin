module SelecaoAdmin
  class Campus < ActiveRecord::Base
    attr_accessible :name, :another_controller, :addresses_attributes, :phones_attributes
    attr_accessor :another_controller    
    validates_presence_of :name    
    validates_uniqueness_of :name
    
    def self.icon
      return 'icon-home'
    end        
    
    has_many :courses, :dependent => :restrict 
    
    has_many :addresses, :source => :resource, :source_type => 'SelecaoAdmin::Campus', :as => 'resource', :inverse_of => :resource
    accepts_nested_attributes_for :addresses, :allow_destroy => true 
    validates_presence_of :addresses
    
    has_many :phones, :source => :resource, :source_type => 'SelecaoAdmin::Campus', :as => 'resource', :inverse_of => :resource
    accepts_nested_attributes_for :phones, :allow_destroy => true  
    validates_presence_of :phones         

   def number_of_members_by_campus
      SelecaoAdmin::EnrollmentEnrolled.find_by_sql("select ca.name, count (*) from selecao_admin_enrolleds e, selecao_admin_enrollments en, selecao_admin_enrollment_enrolleds ee, selecao_admin_courses co, selecao_admin_campi ca where e.id = ee.enrolled_id and en.id = ee.enrollment_id and en.course_id = co.id and ca.id = co.campus_id  group by ca.name;")
   end
   
   def members_by_campus
     # Seleciona qtd cursos por campus = select count(*) from selecao_admin_courses co, selecao_admin_campi ca where co.campus_id = ca.id group by ca.id;
     # Consulta_completa = select ca.name, count (*) from selecao_admin_enrolleds e, selecao_admin_enrollments en, selecao_admin_enrollment_enrolleds ee, selecao_admin_courses co, selecao_admin_campi ca where e.id = ee.enrolled_id and en.id = ee.enrollment_id and en.course_id = co.id and ca.id = co.campus_id  group by ca.name;
   end
  
  end
end
