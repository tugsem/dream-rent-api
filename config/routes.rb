Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  direct :blob do |model, options|
    blob = model.blob
    route_for(:rails_blob, blob.signed_id, blob.filename, only_path: true)
  end

  namespace :api do
    namespace :v1 do
      post 'users/login', to: 'users#login'
      post 'users/register', to: 'users#register'
      get 'users/index', to: 'users#index'

      resources :appointments
      resources :houses
    end
  end
end
