Rails.application.routes.draw do
  resources :seats
  resources :students
  resources :courses
  get "/students/:student_id/courses", to: "courses#index", as: "view_courses_as_student" #Intermediary step for student enrolling in courses
  get "/students/:student_id/courses/:course_id/enroll", to: "students#enroll", as: "enroll_in_course"
  get "/students/:student_id/view_courses", to: "students#view_courses", as: "view_classes"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "menu#mainMenu"
end
