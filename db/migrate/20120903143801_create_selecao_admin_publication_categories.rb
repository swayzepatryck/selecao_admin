class CreateSelecaoAdminPublicationCategories < ActiveRecord::Migration
  def change
    create_table :selecao_admin_publication_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end

# 20120831215631