Rails.application.routes.draw do

  # resources :stylists, only: [:index]
  devise_for :users, defaults: {format: :json}, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'static_pages#landing_page'

  get 'about_us', to: 'static_pages#about_us'
  get 'imprint', to: 'static_pages#imprint'
  get 'privacy', to: 'static_pages#privacy'
  get 'become-a-stylist', to: 'static_pages#become_a_stylist'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Stylist Vue App
  scope :stylists do
    get "/", to: "stylists#app", format: false, as: 'stylist_app'
    get "/*path", to: "stylists#app", format: false
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :brands, only: [:index, :show]
      resources :languages, only: [:index, :show]
      
      resources :bank_accounts do
        get 'current', on: :collection
      end

      resources :businesses do
        get 'current', on: :collection
      end

      scope :auth do
        get 'current', to: 'auth#current'
        get 'authenticated', to: 'auth#authenticated'
      end

      resources :stylists do
        get 'current', on: :collection
        get 'authenticated', on: :collection
        # get 'business', on: :collection, action: :show_current
        # put 'business' on: :collection, action: :update_current
        # resources :brands
      end
    end
  end
end
