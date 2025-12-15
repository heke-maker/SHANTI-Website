Rails.application.routes.draw do
  get "homes/index"
  devise_for :users

  root to: 'homes#index'
  
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :blogs
  resources :users

  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end

  resources :activities
  get 'team', to: 'pages#team'

  resources :tweets 
  get 'activities', to: 'tweets#index'

end
