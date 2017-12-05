Rails.application.routes.draw do
  root 'top#index'

  devise_for :users, path: 'users', controllers: {
    registrations: "users/registrations"
  }
  devise_for :shops, path: 'shops'
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
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at:"/letter_opener"
  end
end
