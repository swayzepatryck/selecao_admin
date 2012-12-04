class CreateSelecaoAdminPhoneTypes < ActiveRecord::Migration
  def change
    create_table :selecao_admin_phone_types do |t|
      t.string :title

      t.timestamps
    end
  end
end
