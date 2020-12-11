Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"


    get "/shelters", to: "shelters#index", as: 'shelters'
    get "/shelters/new", to: "shelters#new", as: 'new_shelter'
    get "/shelters/:id", to: "shelters#show", as: 'show_shelter'
    delete "/shelters/:id", to: "shelters#destroy", as: 'destroy_shelter'
    post "/shelters", to: "shelters#create", as: 'create_shelter'
    get "/shelters/:id/edit", to: "shelters#edit", as: 'edit_shelter'
    patch "/shelters/:id", to: "shelters#update", as: 'update_shelter'


    get "/pets", to: "pets#index", as: 'pets'
    get "/pets/:id", to: "pets#show", as: 'show_pets'
    get "/pets/:id/edit", to: "pets#edit", as: 'edit_pets'
    patch "/pets/:id", to: "pets#update", as: 'update_pets'
    delete "/pets/:id", to: "pets#destroy", as: 'destroy_pets'

    get "/shelters/:shelter_id/pets", to: "shelter_pets#index", as: 'shelter_pets'
    get "/shelters/:shelter_id/pets/new", to: "shelter_pets#new", as: 'new_shelter_pet'
    post "/shelters/:shelter_id/pets", to: "shelter_pets#create", as: 'create_shelter_pet'
    get "/shelters/:id/pets/:id", to: "pets#show", as: 'show_pet'

  resources :applications, as: 'applications'

  get '/admin', to: "admin#index", as: 'admin'

end
