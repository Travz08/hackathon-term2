Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root :to => 'puppies#index', as: :authenticated_root
  end
  root :to => 'home#index'

  get '/about', to: 'home#about', as: 'about'
  get '/contact', to: 'home#contact', as: 'contact'
  get 'home/favorite'
  post '/contact', to: 'home#email'
  resources :puppies do
    put :favorite, on: :member
  end

end
