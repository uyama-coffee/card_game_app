Rails.application.routes.draw do
  root 'top#index'

  resources :resumes
  resources :card_game_experiences
  resources :contacts
  resources :projects
  devise_for :users, path: 'users'
  devise_for :shops, path: 'shops'
end
