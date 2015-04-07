Rails.application.routes.draw do


  resources :users
  resources :registrations, only: [:new, :create]

  resources :projects do
    resources :tasks do
    resource :comments, only: [:new, :show, :create]
  end
  resources :membersips
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
