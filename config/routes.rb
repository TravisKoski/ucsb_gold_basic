Rails.application.routes.draw do
  resources :seats
  resources :students
  resources :courses
  get "/students/:student_id/courses", to: "courses#index", as: "view_courses_as_student" #Intermediary step for student enrolling in courses
  put "/students/:student_id/courses/:course_id/enroll", to: "students#enroll", as: "enroll_in_course"
  get "/students/:student_id/view_courses", to: "students#view_courses", as: "view_classes"
  #route to view the associated students of a course
  get "/courses/:id/view_students", to: "courses#view_students", as: "course_student_roster"
  put "/students/:student_id/courses/:course_id/drop", to: "students#drop_class", as: "drop_class"
  get "/courses/:id/waitlisted_students", to: "courses#view_waitlisted_students", as: "waitlisted_students"
  #email related routes
  get "/students/emails/new", to: "emails#new", as: "new_email"
  post "/students/emails", to: "emails#send"
  get "/students/:id/emails", to: "emails#view", as: "student_emails"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "menu#mainMenu"
end
