class AddNameIndexToSelecaoAdminCities < ActiveRecord::Migration
  def change
    add_index :selecao_admin_cities, :name
  end
end
