Rails.application.routes.draw do
  root 'todos#index'

  resources :todos, only: [:index, :new, :create] do
    member do
      post 'complete'
    end
  end

  resource :session, only: [:new, :create]
end