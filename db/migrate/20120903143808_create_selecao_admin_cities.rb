class CreateSelecaoAdminCities < ActiveRecord::Migration
  def change
    create_table :selecao_admin_cities do |t|
      t.string :name
      t.belongs_to :state

      t.timestamps
    end
    add_index :selecao_admin_cities, :state_id
  end
end
