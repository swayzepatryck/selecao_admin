class CreateSelecaoAdminPublications < ActiveRecord::Migration
  def change
    create_table :selecao_admin_publications do |t|
      t.string :title
      t.text :publication_text
      t.belongs_to :publication_category

      t.timestamps
    end
    add_index :selecao_admin_publications, :publication_category_id
  end
end
