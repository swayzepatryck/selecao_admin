class CreateSelecaoAdminEntryMailTypes < ActiveRecord::Migration
  def change
    create_table :selecao_admin_entry_mail_types do |t|
      t.string :title
      t.text :mail_text

      t.timestamps
    end
  end
end
