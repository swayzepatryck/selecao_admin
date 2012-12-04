class AddInstitucionalToTelephoneType < ActiveRecord::Migration
  def up
     SelecaoAdmin::PhoneType.create(:title => 'Institucional')
   end

   def down
     SelecaoAdmin::PhoneType.find_by_title('Institucional').delete
   end
end
