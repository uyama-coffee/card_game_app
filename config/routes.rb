Rails.application.routes.draw do

  resources :card_game_experiences
  resources :contacts
  resources :projects
  devise_for :users, path: 'users'
  devise_for :shops, path: 'shops'
end
