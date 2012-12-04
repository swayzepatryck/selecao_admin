class CreateSelecaoAdminAddresses < ActiveRecord::Migration
  def change
    create_table :selecao_admin_addresses do |t|
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.belongs_to :city
      t.belongs_to :state
      t.string :postal_code
      t.string :reference_point
      t.belongs_to :address_type
      t.string :resource_type
      t.integer :resource_id

      t.timestamps
    end
    add_index :selecao_admin_addresses, :city_id
    add_index :selecao_admin_addresses, :state_id
    add_index :selecao_admin_addresses, :address_type_id
  end
end
