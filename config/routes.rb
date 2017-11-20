Rails.application.routes.draw do

  namespace :shop do
    get 'top/index'
  end

  root 'top#index'

  resources :mypage, only: [:index]


  resources :resumes
  resources :card_game_experiences
  resources :contacts
  resources :projects
  devise_for :users, path: 'users'
  devise_for :shops, path: 'shops'
end
