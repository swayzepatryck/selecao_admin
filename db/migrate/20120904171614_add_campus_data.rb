class AddCampusData < ActiveRecord::Migration
  def up
    SelecaoAdmin::Campus.create(:name => 'Brasília')
    SelecaoAdmin::Campus.create(:name => 'Gama')
    SelecaoAdmin::Campus.create(:name => 'Planaltina')
    SelecaoAdmin::Campus.create(:name => 'Riacho Fundo')
    SelecaoAdmin::Campus.create(:name => 'Samambaia')
    SelecaoAdmin::Campus.create(:name => 'São Sebastião')
    SelecaoAdmin::Campus.create(:name => 'Taguatinga')
    SelecaoAdmin::Campus.create(:name => 'Taguatinga Centro')
  end

  def down
    SelecaoAdmin::Campus.delete_all
  end
end
