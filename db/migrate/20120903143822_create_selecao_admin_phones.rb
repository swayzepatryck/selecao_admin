class CreateSelecaoAdminPhones < ActiveRecord::Migration
  def change
    create_table :selecao_admin_phones do |t|
      t.belongs_to :phone_type
      t.string :prefix
      t.string :suffix
      t.integer :resource_id
      t.string :resource_type

      t.timestamps
    end
    add_index :selecao_admin_phones, :phone_type_id
  end
end
