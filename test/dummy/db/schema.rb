# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121119131211) do

  create_table "integra_engines", :force => true do |t|
    t.string   "module_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "display_name"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "display_name"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "selecao_admin_address_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_addresses", :force => true do |t|
    t.string   "street"
    t.string   "complement"
    t.string   "neighborhood"
    t.integer  "city_id"
    t.string   "postal_code"
    t.integer  "address_type_id"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "number"
    t.string   "reference_point"
  end

  add_index "selecao_admin_addresses", ["address_type_id"], :name => "index_selecao_admin_addresses_on_address_type_id"
  add_index "selecao_admin_addresses", ["city_id"], :name => "index_selecao_admin_addresses_on_city_id"

  create_table "selecao_admin_announcements", :force => true do |t|
    t.string   "title"
    t.date     "publication_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "selecao_admin_attendance_lecture_presence_statuses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_campi", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "selecao_admin_cities", ["name"], :name => "index_selecao_admin_cities_on_name"
  add_index "selecao_admin_cities", ["state_id"], :name => "index_selecao_admin_cities_on_state_id"

  create_table "selecao_admin_course_prerequisites", :force => true do |t|
    t.integer  "course_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "selecao_admin_course_prerequisites", ["course_id"], :name => "index_selecao_admin_course_prerequisites_on_course_id"

  create_table "selecao_admin_course_shifts", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_course_situations", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_courses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "course_shift_id"
    t.integer  "course_situation_id"
    t.integer  "campus_id"
    t.string   "info_link"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "course_code"
    t.text     "goal"
  end

  add_index "selecao_admin_courses", ["campus_id"], :name => "index_selecao_admin_courses_on_campus_id"
  add_index "selecao_admin_courses", ["course_shift_id"], :name => "index_selecao_admin_courses_on_course_shift_id"
  add_index "selecao_admin_courses", ["course_situation_id"], :name => "index_selecao_admin_courses_on_course_situation_id"

  create_table "selecao_admin_disciplines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_drawing_enrolleds", :force => true do |t|
    t.integer  "drawing_id"
    t.integer  "enrolled_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "selecao_admin_drawing_enrolleds", ["drawing_id"], :name => "index_selecao_admin_drawing_enrolleds_on_drawing_id"
  add_index "selecao_admin_drawing_enrolleds", ["enrolled_id"], :name => "index_selecao_admin_drawing_enrolleds_on_enrolled_id"

  create_table "selecao_admin_drawing_student_quotas", :force => true do |t|
    t.integer  "drawing_id"
    t.integer  "student_quota_id"
    t.integer  "number_of_vacancies"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "selecao_admin_drawing_student_quotas", ["drawing_id"], :name => "index_selecao_admin_drawing_student_quotas_on_drawing_id"
  add_index "selecao_admin_drawing_student_quotas", ["student_quota_id"], :name => "index_selecao_admin_drawing_student_quotas_on_student_quota_id"

  create_table "selecao_admin_drawings", :force => true do |t|
    t.date     "publication_date"
    t.datetime "publication_time"
    t.integer  "employee_id"
    t.integer  "enrollment_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "raffle_time"
    t.date     "raffle_date"
  end

  add_index "selecao_admin_drawings", ["enrollment_id"], :name => "index_selecao_admin_drawings_on_enrollment_id"

  create_table "selecao_admin_enrolled_scores", :force => true do |t|
    t.integer  "enrolled_id"
    t.integer  "discipline_id"
    t.float    "score"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "selecao_admin_enrolled_scores", ["discipline_id"], :name => "index_selecao_admin_enrolled_scores_on_discipline_id"
  add_index "selecao_admin_enrolled_scores", ["enrolled_id"], :name => "index_selecao_admin_enrolled_scores_on_enrolled_id"

  create_table "selecao_admin_enrolled_survey_answers", :id => false, :force => true do |t|
    t.integer  "survey_question_option_id"
    t.integer  "enrolled_id"
    t.string   "other_option"
    t.integer  "enrollment_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "selecao_admin_enrolled_survey_answers", ["enrolled_id"], :name => "sa_enrolled_survey_answers_enrolled_id"
  add_index "selecao_admin_enrolled_survey_answers", ["enrollment_id"], :name => "sa_enrolled_survey_answers_enrollment_id"
  add_index "selecao_admin_enrolled_survey_answers", ["survey_question_option_id"], :name => "sa_enrolled_survey_answers_survey_question_option_id"

  create_table "selecao_admin_enrolleds", :force => true do |t|
    t.date     "birth_date"
    t.integer  "genre_id"
    t.integer  "marital_status_id"
    t.string   "id_card_number"
    t.string   "id_card_issuer"
    t.string   "fathers_name"
    t.string   "mothers_name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "user_id"
  end

  add_index "selecao_admin_enrolleds", ["genre_id"], :name => "index_selecao_admin_enrolleds_on_genre_id"
  add_index "selecao_admin_enrolleds", ["marital_status_id"], :name => "index_selecao_admin_enrolleds_on_marital_status_id"

  create_table "selecao_admin_enrollment_enrolleds", :force => true do |t|
    t.integer  "enrolled_id"
    t.integer  "enrollment_id"
    t.integer  "student_quota_id"
    t.integer  "score_evaluation_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "selecao_admin_enrollment_enrolleds", ["enrolled_id"], :name => "index_selecao_admin_enrollment_enrolleds_on_enrolled_id"
  add_index "selecao_admin_enrollment_enrolleds", ["enrollment_id"], :name => "index_selecao_admin_enrollment_enrolleds_on_enrollment_id"
  add_index "selecao_admin_enrollment_enrolleds", ["score_evaluation_id"], :name => "index_selecao_admin_enrollment_enrolleds_on_score_evaluation_id"
  add_index "selecao_admin_enrollment_enrolleds", ["student_quota_id"], :name => "index_selecao_admin_enrollment_enrolleds_on_student_quota_id"

  create_table "selecao_admin_enrollment_score_evaluations", :id => false, :force => true do |t|
    t.integer  "enrollment_id"
    t.integer  "score_evaluation_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "selecao_admin_enrollment_score_evaluations", ["enrollment_id"], :name => "sa_enrollment_score_evaluations_enrollment_id"
  add_index "selecao_admin_enrollment_score_evaluations", ["score_evaluation_id"], :name => "sa_enrollment_score_evaluations_score_evaluation_id"

  create_table "selecao_admin_enrollment_student_quotas", :force => true do |t|
    t.integer  "enrollment_id"
    t.integer  "student_quota_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "selecao_admin_enrollment_student_quotas", ["enrollment_id"], :name => "sa_enrollment_student_quota_enrollment_id"
  add_index "selecao_admin_enrollment_student_quotas", ["student_quota_id"], :name => "sa_enrollment_student_quota_student_quota_id"

  create_table "selecao_admin_enrollments", :force => true do |t|
    t.integer  "announcement_id"
    t.integer  "course_id"
    t.integer  "survey_id"
    t.integer  "entry_process_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "number_of_vacancies"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "lecture_type_id"
  end

  add_index "selecao_admin_enrollments", ["announcement_id"], :name => "index_selecao_admin_enrollments_on_announcement_id"
  add_index "selecao_admin_enrollments", ["course_id"], :name => "index_selecao_admin_enrollments_on_course_id"
  add_index "selecao_admin_enrollments", ["entry_process_id"], :name => "index_selecao_admin_enrollments_on_entry_process_id"
  add_index "selecao_admin_enrollments", ["survey_id"], :name => "index_selecao_admin_enrollments_on_survey_id"

  create_table "selecao_admin_entry_mail_types", :force => true do |t|
    t.string   "title"
    t.text     "mail_text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_entry_mails", :force => true do |t|
    t.integer  "sender_user_id"
    t.integer  "recipient_user_id"
    t.integer  "entry_mail_type_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "selecao_admin_entry_mails", ["entry_mail_type_id"], :name => "index_selecao_admin_entry_mails_on_entry_mail_type_id"

  create_table "selecao_admin_entry_process_modes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_entry_processes", :force => true do |t|
    t.string   "name"
    t.integer  "entry_process_mode_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "selecao_admin_entry_processes", ["entry_process_mode_id"], :name => "index_selecao_admin_entry_processes_on_entry_process_mode_id"

  create_table "selecao_admin_genres", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_lecture_presences", :force => true do |t|
    t.integer  "lecture_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "attendance_lecture_presence_status_id"
    t.string   "enrolled_unique_id"
  end

  add_index "selecao_admin_lecture_presences", ["lecture_id"], :name => "sa_lecture_presences_lecture_id"

  create_table "selecao_admin_lecture_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_lectures", :force => true do |t|
    t.string   "title"
    t.string   "video_url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "lecture_type_id"
    t.date     "lecture_date"
    t.datetime "lecture_time"
    t.integer  "max_capacity"
    t.string   "location"
    t.integer  "announcement_id"
    t.integer  "campus_id"
  end

  create_table "selecao_admin_marital_statuses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_online_lecture_codes", :force => true do |t|
    t.string   "code"
    t.integer  "lecture_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "code_sequence"
  end

  add_index "selecao_admin_online_lecture_codes", ["lecture_id"], :name => "index_selecao_admin_online_lecture_codes_on_online_lecture_id"

  create_table "selecao_admin_phone_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_phones", :force => true do |t|
    t.integer  "phone_type_id"
    t.string   "prefix"
    t.string   "suffix"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "description"
  end

  add_index "selecao_admin_phones", ["phone_type_id"], :name => "index_selecao_admin_phones_on_phone_type_id"

  create_table "selecao_admin_publication_categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_publications", :force => true do |t|
    t.string   "title"
    t.text     "publication_text"
    t.integer  "publication_category_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "selecao_admin_publications", ["publication_category_id"], :name => "index_selecao_admin_publications_on_publication_category_id"

  create_table "selecao_admin_score_evaluation_disciplines", :id => false, :force => true do |t|
    t.integer  "score_evaluation_id"
    t.integer  "discipline_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "selecao_admin_score_evaluation_disciplines", ["discipline_id"], :name => "sa_score_evaluation_disciplines_discipline_id"
  add_index "selecao_admin_score_evaluation_disciplines", ["score_evaluation_id"], :name => "sa_score_evaluation_disciplines_score_evaluation_id"

  create_table "selecao_admin_score_evaluations", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selecao_admin_states", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "selecao_admin_states", ["code"], :name => "index_selecao_admin_states_on_code"

  create_table "selecao_admin_student_quotas", :force => true do |t|
    t.string   "title"
    t.string   "abbreviation"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "active"
  end

  create_table "selecao_admin_survey_question_options", :force => true do |t|
    t.integer  "survey_question_id"
    t.string   "option"
    t.boolean  "is_others"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "sequence_number"
  end

  add_index "selecao_admin_survey_question_options", ["survey_question_id"], :name => "sa_survey_question_options_survey_question_id"

  create_table "selecao_admin_survey_questions", :force => true do |t|
    t.integer  "survey_id"
    t.string   "question"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "sequence_number"
  end

  add_index "selecao_admin_survey_questions", ["survey_id"], :name => "index_selecao_admin_survey_questions_on_survey_id"

  create_table "selecao_admin_surveys", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "survey_code"
  end

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "sub_drawns", :force => true do |t|
    t.integer  "sub_raffle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sub_enrolled_enrollment_id"
  end

  create_table "sub_enrolled_enrollments", :force => true do |t|
    t.integer  "sub_enrollment_id"
    t.integer  "sub_vacancy_type_id"
    t.integer  "sub_enrolled_id"
    t.integer  "raffle_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sub_enrolled_enrollment_status_id"
    t.boolean  "requirement"
  end

  create_table "sub_raffles", :force => true do |t|
    t.date     "raffle_date"
    t.time     "raffle_time"
    t.integer  "sub_enrollment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employee_id"
    t.string   "employee_name"
    t.string   "employee_email"
    t.string   "employee_phone"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "login"
    t.boolean  "admin"
    t.boolean  "employee"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
