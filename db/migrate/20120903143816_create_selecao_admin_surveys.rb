class CreateSelecaoAdminSurveys < ActiveRecord::Migration
  def change
    create_table :selecao_admin_surveys do |t|
      t.string :title

      t.timestamps
    end
  end
end
