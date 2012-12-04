class CreateSelecaoAdminEnrollments < ActiveRecord::Migration
  def change
    create_table :selecao_admin_enrollments do |t|
      t.belongs_to :announcement
      t.belongs_to :course
      t.belongs_to :survey
      t.belongs_to :entry_process
      t.date :start_date
      t.date :end_date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :number_of_vacancies
      t.belongs_to :online_lecture
      t.belongs_to :online_lecture_type

      t.timestamps
    end
    add_index :selecao_admin_enrollments, :announcement_id
    add_index :selecao_admin_enrollments, :course_id
    add_index :selecao_admin_enrollments, :survey_id
    add_index :selecao_admin_enrollments, :entry_process_id
    add_index :selecao_admin_enrollments, :online_lecture_id
  end
end
