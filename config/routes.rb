Rails.application.routes.draw do
  root "articles#index"

  #For Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #For Users
  devise_for :users
  resources :articles
  get "up" => "rails/health#show", as: :rails_health_check
end
