Rails.application.routes.draw do

  get 'about_us', to: 'static_pages#about_us'
  get 'imprint', to: 'static_pages#imprint'
  get 'privacy', to: 'static_pages#privacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'static_pages#landing_page'

  # Vue App
  scope :app do
    get "/", to: "app#app", format: false
    
    get "/*path", to: "app#app", format: false
  end
end
