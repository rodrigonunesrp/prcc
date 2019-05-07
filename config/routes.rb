Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json }  do
    resources :users, only: [:create]
  end
  
  namespace :admin do
    resources :users, except: [:show, :destroy]
  end

  root to: "admin/users#index"

end
