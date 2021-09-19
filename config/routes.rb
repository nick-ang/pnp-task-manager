Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users
  resources :users
  resources :projects do
    resources :tasks, only: [:new, :create, :show]
    resources :project_assigns
  end
  resources :tasks, only: [:edit, :update, :destroy, :index]
  resources :wikis
  resources :notes
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
