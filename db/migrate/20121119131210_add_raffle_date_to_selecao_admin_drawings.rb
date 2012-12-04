class AddRaffleDateToSelecaoAdminDrawings < ActiveRecord::Migration
  def change
    add_column :selecao_admin_drawings, :raffle_date, :date
  end
end
