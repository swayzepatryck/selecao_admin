class AddDescriptionToSelecaoAdminPhones < ActiveRecord::Migration
  def change
    add_column :selecao_admin_phones, :description, :string
  end
end
