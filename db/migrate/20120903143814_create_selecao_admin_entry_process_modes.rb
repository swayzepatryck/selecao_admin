class CreateSelecaoAdminEntryProcessModes < ActiveRecord::Migration
  def change
    create_table :selecao_admin_entry_process_modes do |t|
      t.string :name

      t.timestamps
    end
  end
end
