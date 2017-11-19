Rails.application.routes.draw do
  resources :contacts
  resources :projects
  devise_for :users, path: 'users'
  devise_for :shops, path: 'shops'
end
