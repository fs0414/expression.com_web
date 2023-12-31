Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[new create]

  root 'sentences#index'

  resources :sentences, only: %i[new create update destroy] do
    resources :other_sentences, only: %i[new create destroy]
  end
end
