Rails.application.routes.draw do
  resources :answers
  resources :users

  get "/answers/new/:id/:ansnum", to: "answers#new", as: :user_new_answer
  post "/answers/new/:id/:ansnum/:result", to: "answers#create", as: :user_create_answer
  get "/answers/user_answer/:user_id", to: "answers#user_answer", as: :user_answer
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
