class AddCourseSituationsData < ActiveRecord::Migration
  def up
    SelecaoAdmin::CourseSituation.create(:title => 'Ativo')
    SelecaoAdmin::CourseSituation.create(:title => 'Inativo')    
  end

  def down
    SelecaoAdmin::CourseSituation.delete_all
  end
end
