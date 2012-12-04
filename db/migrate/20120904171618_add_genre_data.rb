class AddGenreData < ActiveRecord::Migration
  def up
    SelecaoAdmin::Genre.create(:name => 'Masculino')
    SelecaoAdmin::Genre.create(:name => 'Femenino')
  end

  def down
    SelecaoAdmin::Genre.delete_all
  end
end
