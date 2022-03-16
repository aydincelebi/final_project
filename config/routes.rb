Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace,
        defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :styles

      resources :interview_styles

      resources :job_categories

      resources :categories

      resources :interviews

      resources :users

      resources :job_applications

      resources :companies
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  ActiveAdmin.routes(self)
  root to: "companies#index"
  resources :styles
  resources :interview_styles
  resources :job_categories
  resources :categories
  resources :interviews
  resources :users
  resources :job_applications
  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
