Rails.application.routes.draw do

  devise_for :users
<<<<<<< HEAD
  
  authenticated :user do
    root :to => 'puppies#index', as: :authenticated_root
  end
  root :to => 'home#index'
  resources :puppies

=======

  resources :puppies do
    put :favorite, on: :member
  end
>>>>>>> d127f24285e53acd26ee8f6cd996c97ca7df25b5
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
