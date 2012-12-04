class AddInicialLectureTypesData < ActiveRecord::Migration
  def up
    SelecaoAdmin::LectureType.create(:title => 'Presencial')
    SelecaoAdmin::LectureType.create(:title => 'Online')
  end

  def down
    SelecaoAdmin::LectureType.delete_all
  end
end
