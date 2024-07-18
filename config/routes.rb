Rails.application.routes.draw do
  devise_for :admins
  authenticated :admin do
    root to: "admin#index", as: :admin_root
  end

  root "home#index"
  get "admin" => "admin#index"
  get "up" => "rails/health#show", as: :rails_health_check
  
  namespace :admin do
    resources :orders
    resources :categories
    resources :products do
      resources :stocks
    end
  end
end
