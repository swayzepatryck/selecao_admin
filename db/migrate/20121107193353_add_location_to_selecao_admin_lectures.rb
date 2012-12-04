class AddLocationToSelecaoAdminLectures < ActiveRecord::Migration
  def change
    add_column :selecao_admin_lectures, :location, :string
  end
end
