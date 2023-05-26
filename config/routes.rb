Rails.application.routes.draw do
  resources :books, only: [:new, :create, :index, :show]

  get 'homes/top'
  devise_for :users
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  
  resources :users, only: [:show, :edit,:index]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
