class CreateSelecaoAdminEntryProcesses < ActiveRecord::Migration
  def change
    create_table :selecao_admin_entry_processes do |t|
      t.string :name
      t.belongs_to :entry_process_mode

      t.timestamps
    end
    add_index :selecao_admin_entry_processes, :entry_process_mode_id
  end
end
