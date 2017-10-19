Rails.application.routes.draw do

<<<<<<< HEAD
  devise_for :users
  
  authenticated :user do
    root :to => 'puppies#index', as: :authenticated_root
  end
  root :to => 'home#index'
  resources :puppies

=======
  root 'home#index'
  get '/about', to: 'home#about', as: 'about'
  get '/contact', to: 'home#contact', as: 'contact'
  get 'home/favorite'

  devise_for :users

  resources :puppies do
    put :favorite, on: :member
  end
>>>>>>> 48ea7b2... added css and homepage image, edited navbar, created home controller
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
