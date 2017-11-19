Rails.application.routes.draw do
  resources :mypages
  resources :resumes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts
  resources :projects
  devise_for :users, path: 'users'
  devise_for :shops, path: 'shops'
end
