class CreateSelecaoAdminEntryMails < ActiveRecord::Migration
  def change
    create_table :selecao_admin_entry_mails do |t|
      t.integer :sender_user_id
      t.integer :recipient_user_id
      t.belongs_to :entry_mail_type

      t.timestamps
    end
    add_index :selecao_admin_entry_mails, :entry_mail_type_id
  end
end
