  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :gigs, only: %i[index show update]
      resources :creators, only: %i[index show create] do
        resources :gigs, only: :create
      end
    end
  end
end
