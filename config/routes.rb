Rails.application.routes.draw do

  devise_for :users
  
  authenticated :user do
    root :to => 'puppies#index', as: :authenticated_root
  end
  root :to => 'home#index'
  resources :puppies

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
