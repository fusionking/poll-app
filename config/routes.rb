Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :polls, only: [:new, :create, :index, :show] do
  	resources :responses, only: [:new, :create]
  	resources :questions, only: [:new, :create]
  end

 
  root to: 'polls#index'
end
