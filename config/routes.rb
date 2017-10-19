Rails.application.routes.draw do

  root 'home#index'
  get '/about', to: 'home#about', as: 'about'
  get '/contact', to: 'home#contact', as: 'contact'
  get 'home/favorite'

  devise_for :users

  resources :puppies do
    put :favorite, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
