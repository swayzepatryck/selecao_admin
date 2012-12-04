class CreateSelecaoAdminGenres < ActiveRecord::Migration
  def change
    create_table :selecao_admin_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end
