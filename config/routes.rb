Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"

  resources :shelters, as: 'shelters'

  resources :pets, as: 'pets'

  resources :applications, as: 'applications'

  resources :shelter_pets, as: 'shelter_pets'
end
