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
  get "/students/:id/emails/new", to: "emails#new", as: "new_email"
  post "/students/:id/emails", to: "emails#create", as: "emails"
  get "/students/:id/emails", to: "emails#index", as: "student_emails"
  get "/students/:id/emails/inbox", to: "emails#viewInbox", as: "email_inbox"
  get "/students/:id/emails/sentEmails", to: "emails#viewSentEmails", as: "sent_emails"
  get "/students/:id/emails/:email_id", to: "emails#show", as: "email"
  


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "menu#mainMenu"
end
