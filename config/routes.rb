Rails.application.routes.draw do
  root :to => "companies#index"
  resources :styles
  resources :interview_styles
  resources :job_categories
  resources :categories
  resources :application_websites
  resources :job_types
  resources :interviews
  resources :users
  resources :job_applications
  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
