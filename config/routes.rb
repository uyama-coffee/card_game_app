Rails.application.routes.draw do
  root 'top#index'

  devise_for :users, path: 'users', controllers: {
    registrations: "users/registrations"
  }
  devise_for :shops, path: 'shops'
  namespace :shops do
    get 'top/index'
    get 'contacts/index'
  end
  resources :mypage, only: [:index]
  resources :resumes
  resources :card_game_experiences
  resources :contacts
  resources :projects
  namespace :shop do
    get 'top/index'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at:"/letter_opener"
  end
end
