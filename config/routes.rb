Rails.application.routes.draw do
  # get 'users/edit'
  # get 'users/index'
  # get 'users/show'
  # get 'books/edit'
  # get 'books/index'
  # get 'books/show'
  devise_for :users
  # get 'homes/top'
  root to: 'homes#top'
  get 'home/about' => "homes#about"
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:show, :edit, :index, :update, :create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
