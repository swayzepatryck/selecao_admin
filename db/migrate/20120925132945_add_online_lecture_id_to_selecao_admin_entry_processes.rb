class AddOnlineLectureIdToSelecaoAdminEntryProcesses < ActiveRecord::Migration
  def change
    add_column :selecao_admin_entry_processes, :online_lecture_id, :integer
  end
end
