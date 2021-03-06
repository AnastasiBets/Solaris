Rails.application.routes.draw do

  get 'images/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "pages#index"

  get 'pages/contacts'
  get 'pages/about'
  get 'pages/sponsors'

  resources :posts do
    resources :postcomments
   end

resources :photos do 
    member do 
      get :vote
    end
  end
  
resources :images do
    member do
      get :voteforphoto
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
