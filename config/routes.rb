Rails.application.routes.draw do
  resources :gathers
  resources :stickerbooks
  resources :rules
  resources :zones
  resources :users
  resources :collectibles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do # /api/data

    get '/data', to: 'tests#index'
    
    resources :dogs

  end

  get '*path', to: "static_pages#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
