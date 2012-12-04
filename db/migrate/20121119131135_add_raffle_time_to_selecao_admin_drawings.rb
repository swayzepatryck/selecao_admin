class AddRaffleTimeToSelecaoAdminDrawings < ActiveRecord::Migration
  def change
    add_column :selecao_admin_drawings, :raffle_time, :datetime
  end
end
