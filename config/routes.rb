Rails.application.routes.draw do

  devise_for :users

  resources :puppies do
    put :favorite, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
