Rails.application.routes.draw do
  resources :users
  namespace :v1, defaults: { format: :json }  do
    resources :users, only: [:create]
  end
  
  namespace :admin do
    resources :users, except: [:put, :update, :show, :destroy]
  end

  root to: "admin/users#index"

end
