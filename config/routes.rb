Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'users', to: 'users#new'
  resources :users, only: %i[new create]

  resources :sentences, only: %i[index new create update destroy] do
    resources :other_sentences, only: %i[new create update destroy]
  end
end
