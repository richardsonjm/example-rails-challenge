Rails.application.routes.draw do
  resources :charges, except: [:edit, :update, :destroy]
end
