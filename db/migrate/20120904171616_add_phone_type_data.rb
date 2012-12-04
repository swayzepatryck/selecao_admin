class AddPhoneTypeData < ActiveRecord::Migration
  def up
    SelecaoAdmin::PhoneType.create(:title => 'Residencial')
    SelecaoAdmin::PhoneType.create(:title => 'Comercial')
    SelecaoAdmin::PhoneType.create(:title => 'Móvel')
    SelecaoAdmin::PhoneType.create(:title => 'Institucional')
    SelecaoAdmin::PhoneType.create(:title => 'Outros')
  end

  def down
    SelecaoAdmin::PhoneType.delete_all
  end
end
