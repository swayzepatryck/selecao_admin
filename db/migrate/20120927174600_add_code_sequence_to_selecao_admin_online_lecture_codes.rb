class AddCodeSequenceToSelecaoAdminOnlineLectureCodes < ActiveRecord::Migration
  def change
    add_column :selecao_admin_online_lecture_codes, :code_sequence, :integer
  end
end
