Rails.application.routes.draw do
  devise_for :users

  root 'tweets#index'
  
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pa#manifest", as: :pwa_manifest

  get 'tweets/:tweet_id/likes' => 'likes#create'
  get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'

  resources :blogs
  resources :users

  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
end
