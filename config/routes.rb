Rails.application.routes.draw do
  resources :projects
  devise_for :users, path: 'users'
  devise_for :shops, path: 'shops'
end
