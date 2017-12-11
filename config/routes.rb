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
  namespace :shops do
    get 'top/index'
    get 'contacts/index'
    get 'contacts/show'
  end
  resources :mypage, only: [:index]
  resources :resumes
  resources :contacts
  resources :projects do
    resources :contacts , only: [:index, :create, :destroy]
  end
  namespace :shop do
    get 'top/index'
    resources :projects
    resources :shops, only: [:edit, :update]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at:"/letter_opener"
  end
end
