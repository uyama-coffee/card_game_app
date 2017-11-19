Rails.application.routes.draw do
  devise_for :users, path: 'users'
  devise_for :shops, path: 'shops'
end
