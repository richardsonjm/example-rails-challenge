Rails.application.routes.draw do
  resources :charges, except: [:edit, :update, :destroy], param: :unique_code
end
