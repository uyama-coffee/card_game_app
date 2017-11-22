Rails.application.routes.draw do
  resources :resumes
  resources :card_game_experiences
  resources :contacts
  resources :projects
  devise_for :users, path: 'users', controllers: {
    registrations: "users/registrations"
  }
  devise_for :shops, path: 'shops'
  devise_scope :shop do
    authenticated :shop do
      get 'shops/contacts', to: 'shops/contacts#index', as: :shop_contacts
    end
    unauthenticated :shop do
      get 'shops/top', to: 'shops/top#index', as: :shop_top
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at:"/letter_opener"
  end
end
