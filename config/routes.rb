Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  options '*path', to: 'application#cors_preflight_check'

  namespace :api do
    namespace :v1 do
      post 'users/login'
      post 'users/register'
      get 'users/index'

      resources :appointments
      resources :houses
    end
  end
end
