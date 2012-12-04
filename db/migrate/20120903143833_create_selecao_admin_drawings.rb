class CreateSelecaoAdminDrawings < ActiveRecord::Migration
  def change
    create_table :selecao_admin_drawings do |t|
      t.date :publication_date
      t.datetime :publication_time
      t.integer :employee_id
      t.belongs_to :enrollment

      t.timestamps
    end
    add_index :selecao_admin_drawings, :enrollment_id
  end
end
