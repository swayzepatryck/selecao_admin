class AddCourseShiftsData < ActiveRecord::Migration
  def up
    SelecaoAdmin::CourseShift.create(:title => 'Matutino')
    SelecaoAdmin::CourseShift.create(:title => 'Vespertino')
    SelecaoAdmin::CourseShift.create(:title => 'Noturno')
    SelecaoAdmin::CourseShift.create(:title => 'Diurno')   
  end

  def down
    SelecaoAdmin::CourseSituation.delete_all
  end
end
