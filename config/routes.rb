Rails.application.routes.draw do


  resources :users
  resources :registrations, only: [:new, :create]

  resources :projects do
    resources :tasks, :memberships
  end

  root 'welcome#index'
  get 'faq' =>'common_questions#index'
  get 'about' => 'about#index'
  get 'terms' => 'terms#index'
  get 'projects' => 'projects#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'



  end
