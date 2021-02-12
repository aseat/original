Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
 
  root to: "concretes#index"
  resources :users
  resources :ways do
  resources :likes, only: [:create, :destroy]
  resources :waycomments, only: [:create, :destroy]
  end

  resources :questions do
    resources :choices, only: [:index,:create]
  end

  resources :answers do
    resources :responses, only: [:create]
  end

  resources :words
end
