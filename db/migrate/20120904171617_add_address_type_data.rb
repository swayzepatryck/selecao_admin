class AddAddressTypeData < ActiveRecord::Migration
  def up
    SelecaoAdmin::AddressType.create(:title => 'Residencial')
    SelecaoAdmin::AddressType.create(:title => 'Comercial')
    SelecaoAdmin::AddressType.create(:title => 'Institucional')    
    SelecaoAdmin::AddressType.create(:title => 'Outros')
  end

  def down
    SelecaoAdmin::AddressType.delete_all
  end
end
