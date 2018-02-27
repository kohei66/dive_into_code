Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]
  root to: 'sessions#new'
  resources :users, only: %i[new create show]
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
