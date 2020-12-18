Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"

  resources :pets do
  end

  resources :shelters do
    resources :pets, controller: "shelter_pets", only: [:index, :show, :new, :create]
  end

  resources :pet_applications

  resources :applications do
    resources :pets, controller: "pet_applications", only: [:create, :update, :post]
  end

  scope 'admin' do
    resources :applications, controller: "admin_applications", only: [:show, :update]
  end
end
