class CreateSelecaoAdminEnrolleds < ActiveRecord::Migration
  def change
    create_table :selecao_admin_enrolleds do |t|
      t.date :birth_date
      t.belongs_to :genre
      t.belongs_to :marital_status
      t.string :id_card_number
      t.string :id_card_issuer
      t.string :fathers_name
      t.string :mothers_name

      t.timestamps
    end
    add_index :selecao_admin_enrolleds, :genre_id
    add_index :selecao_admin_enrolleds, :marital_status_id
  end
end
