Rails.application.routes.draw do
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  get 'home/top'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'home#top'
  get "home/about" => "home#about", as: "about"
  
  resources :users, only: [:show, :edit, :index, :update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
