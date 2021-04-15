Rails.application.routes.draw do

  # resources :stylists, only: [:index]

  devise_for :stylists, defaults: {format: :json}, controllers: {
    sessions: 'stylists/sessions',
    registrations: 'stylists/registrations'
  }

  devise_for :users

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
      resources :brands

      resources :stylists do
        get 'current', on: :collection
        get 'authenticated', on: :collection
      end
    end
  end
end
