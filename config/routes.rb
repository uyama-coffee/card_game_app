Rails.application.routes.draw do
  root 'top#index'
  
  devise_for :users, path: 'users'
  devise_for :shops, path: 'shops'
　　　　
  resources :mypage, only: [:index]
  resources :resumes
  resources :card_game_experiences
  resources :contacts
  resources :projects
  
  namespace :shop do
    get 'top/index'
  end
end
