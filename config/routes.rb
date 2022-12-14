Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/management', as: 'rails_admin'

  # resources :stylists, only: [:index]
  devise_for :users, defaults: {format: :json}, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'static_pages#landing_page'

  get "static_pages/:title", to: "static_pages#static_page_content"

  get 'terms', to: 'static_pages#landing_page'
  get 'about_us', to: 'static_pages#landing_page'
  get 'imprint', to: 'static_pages#landing_page'
  get 'privacy', to: 'static_pages#landing_page'
  get 'become-a-stylist', to: 'static_pages#landing_page'

  get 'profiles/:md5_identifier', to: 'static_pages#landing_page'
  get 'review/:md5_identifier', to: 'static_pages#landing_page'

  get 'reviews/v', to: 'api/v1/reviews#verify', as: 'verify_review_email' #verify with email token

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Common User Vue App
  scope :dashboard do
    get "/", to: "vue#user_app", format: false, as: 'user_app'
    get "/*path", to: "vue#user_app", format: false
  end

  # Brides Vue App
  scope :brides do
    get "/", to: "vue#bride_app", format: false, as: 'bride_app'
    get "/*path", to: "vue#bride_app", format: false
  end

  # Stylist Vue App
  scope :stylists do
    get "/", to: "vue#stylist_app", format: false, as: 'stylist_app'
    get "/*path", to: "vue#stylist_app", format: false
  end

  scope :wh, :defaults => { :format => :json } do#webhooks
    post ENV['wh_getid_started_url'], controller: 'webhooks', action: 'getid_started', as: 'getid_started'
    post ENV['wh_getid_complete_url'], controller: 'webhooks', action: 'getid_complete', as: 'getid_complete'
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

      resources :reviews, only: [:create, :update]

      resources :portfolio_images

      scope :auth do
        get 'current', to: 'auth#current'
        get 'authenticated', to: 'auth#authenticated'
        get 'fb_oauth_path', to: 'auth#fb_oauth_path'
      end


      resources :service_extras, only: [:index] do

      end

      resources :users do
        get 'current', on: :collection
        get 'authenticated', on: :collection        
        get 'request_jwt_getid', on: :collection
      end

      resources :stylists do
        get 'current', on: :collection

        get 'public/:md5_identifier', action: 'public', on: :collection

        get 'authenticated', on: :collection
        get 'user_mandate', on: :collection
        # get 'business', on: :collection, action: :show_current
        # put 'business' on: :collection, action: :update_current
        # resources :brands
      end
    end
  end

  # get "/*path", to: "static_pages#landing_page", format: false
end
