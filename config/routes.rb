Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users
  resources :users
  patch "/kanbans/:id/sort", to: "kanbans#sort", as: "kanban_sort"
  resources :projects do
    resources :tasks, only: [:new, :create, :show]
    resources :project_assigns
    resources :kanbans
  end
  resources :tasks, only: [:edit, :update, :destroy, :index]
  resources :wikis
  resources :notes
  resources :chatrooms do
    resources :messages, only: :create
    resources :chatroom_assigns
  end
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
