Rails.application.routes.draw do
  resources :resumes
  resources :card_game_experiences
  resources :contacts
  resources :projects
  devise_for :users, path: 'users', controllers: {
    registrations: "users/registrations"
  }
  devise_for :shops, path: 'shops'
  devise_scope :shops do
    get 'shops/top', to: 'shops/top#index', as: :shops_top
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at:"/letter_opener"
  end
end
