class AddMaritalStatusData < ActiveRecord::Migration
  def up
    SelecaoAdmin::MaritalStatus.create(:title => 'Solteiro(a)')
    SelecaoAdmin::MaritalStatus.create(:title => 'Casado(a)')
    SelecaoAdmin::MaritalStatus.create(:title => 'Separado(a)')
    SelecaoAdmin::MaritalStatus.create(:title => 'Divorciado(a)')
    SelecaoAdmin::MaritalStatus.create(:title => 'Viúvo(a)')
    SelecaoAdmin::MaritalStatus.create(:title => 'União Estável')    
  end

  def down
    SelecaoAdmin::MaritalStatus.delete_all
  end
end
