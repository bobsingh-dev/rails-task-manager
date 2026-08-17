Rails.application.routes.draw do
 

  root "tasks#index"

  resources :tasks do
    patch :toggle, on: :member
  end
  get "up" => "rails/health#show", as: :rails_health_check

 
end
