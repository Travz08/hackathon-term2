Rails.application.routes.draw do

<<<<<<< HEAD
  devise_for :users
<<<<<<< HEAD
  
  authenticated :user do
    root :to => 'puppies#index', as: :authenticated_root
  end
  root :to => 'home#index'
  resources :puppies

=======
<<<<<<< HEAD
=======
  root 'home#index'
  get '/about', to: 'home#about', as: 'about'
  get '/contact', to: 'home#contact', as: 'contact'
  get 'home/favorite'

  devise_for :users
>>>>>>> 62a571ab4fba04cdd2c7dc06330a7f83df7862e4

  resources :puppies do
    put :favorite, on: :member
  end
<<<<<<< HEAD
>>>>>>> d127f24285e53acd26ee8f6cd996c97ca7df25b5
=======
>>>>>>> 48ea7b2... added css and homepage image, edited navbar, created home controller
>>>>>>> 62a571ab4fba04cdd2c7dc06330a7f83df7862e4
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
