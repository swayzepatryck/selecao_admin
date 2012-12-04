class CreateSelecaoAdminDisciplines < ActiveRecord::Migration
  def change
    create_table :selecao_admin_disciplines do |t|
      t.string :name

      t.timestamps
    end
  end
end
