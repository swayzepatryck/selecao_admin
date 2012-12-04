class CreateSelecaoAdminCampi < ActiveRecord::Migration
  def change
    create_table :selecao_admin_campi do |t|
      t.string :name

      t.timestamps
    end
  end
end
