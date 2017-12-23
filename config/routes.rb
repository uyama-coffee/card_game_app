Rails.application.routes.draw do
  root 'top#index'

  devise_for :users, path: 'users', controllers: {
    registrations: "users/registrations",
    sessions:      'users/sessions',

  }

  devise_for :shops, path: 'shops', controllers: {
  sessions:      'shops/sessions',
  passwords:     'shops/passwords',
  registrations: 'shops/registrations'
  }

  resources :mypage, only: [:index]
  resources :resumes
  resources :projects, only: [:index, :show] do
    resources :contacts , only: [:index, :create, :destroy]
  end

  namespace :shop do
    resources :top, only: [:index]
    resources :projects
    resources :contacts, only:[:index,:show,:update]
    resources :shops, only: [:edit, :update]
    resources :shop_informations
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at:"/letter_opener"
  end
end
