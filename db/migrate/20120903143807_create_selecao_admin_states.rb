class CreateSelecaoAdminStates < ActiveRecord::Migration
  def change
    create_table :selecao_admin_states do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
