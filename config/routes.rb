Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "recipes#index"

  get 'show_session' => 'sessions#index'
  get 'set_session' => 'sessions#set_session'
  get 'another' => 'sessions#another'

  resources :recipes do
    resources :ingredients

    member do
      post 'add_favorite'
      delete 'remove_favorite'
    end
  end
end
