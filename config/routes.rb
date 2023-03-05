Rails.application.routes.draw do
  root 'dashboards#index'
  resources :connections
  resources :courses
  resources :batches
  resources :schools
  devise_for :users
  resources :dashboards do
    collection do
      get :add_request
      get :request_review
      get :list_batch
      get :list_school
      get :list_school_admin
      get :approve_request
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "coures#index"
end
