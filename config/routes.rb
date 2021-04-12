Rails.application.routes.draw do

  # resources :stylists, only: [:index]

  devise_for :stylists, controllers: {
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
    get "/", to: "stylists#app", format: false
    
    get "/*path", to: "stylists#app", format: false
  end
end
