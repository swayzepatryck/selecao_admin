class CreateSelecaoAdminMaritalStatuses < ActiveRecord::Migration
  def change
    create_table :selecao_admin_marital_statuses do |t|
      t.string :title

      t.timestamps
    end
  end
end
