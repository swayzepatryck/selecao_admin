class AddEntryProcessModeData < ActiveRecord::Migration
  def up
    SelecaoAdmin::EntryProcessMode.create(:name => 'Avaliação de Nota')
    SelecaoAdmin::EntryProcessMode.create(:name => 'Sorteio')
  end

  def down
    SelecaoAdmin::EntryProcessMode.delete_all
  end
end
