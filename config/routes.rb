SelecaoAdmin::Engine.routes.draw do
  get "reports/index"
  match "/settings" => "settings#index"
  match "/reports" => "reports#index"
  match "/find/drawing_student_quotas/:enrollment_id" => "drawings#drawing_student_quotas"  
  match "/json_entry_process_mode/:id" => "entry_processes#json_entry_process_mode"  
  match "drawings_transfer_vacancy" => "drawings#transfer_vacancy"

  resources :enrolleds_data_table  
  resources :enrolled_scores
  resources :drawings
  resources :enrollments_enrolleds
  resources :enrolled_survey_answers
  resources :enrolleds
  resources :online_lecture_codes
  resources :student_quotas
  resources :lectures
  resources :course_prerequisites
  resources :courses
  resources :campi
  resources :phones
  resources :addresses
  resources :enrollment_enrolleds

  resources :score_evaluations 
  resources :disciplines    

  resources :survey_question_options
  resources :survey_questions
  resources :surveys
  resources :entry_processes
  resources :entry_process_modes
  resources :announcements do
    resources :enrollments    
  end
  
  resources :course_shifts
  resources :course_situations
  resources :phone_types
  resources :address_types
  resources :cities
  resources :employees
  resources :states
  resources :marital_statuses
  resources :genres
  resources :entry_mails
  resources :entry_mail_types
  resources :publications
  resources :publication_categories  
  root :to => "welcome#index"
end
