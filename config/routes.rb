Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'movies#index'
  get 'movies/index', to: 'movies#index'

  resources :movies do
    resources :ratings
  end

  resources :categories
end
