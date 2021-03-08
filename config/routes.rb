Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
    
    resources :items, only: [:index, :create, :show, :edit, :update]
    resources :genre, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show]
  end
  
  namespace :public do
    get 'homes/top'
    get 'homes/about'
    
    resources :items, only: [:index, :show,]
    resources :customers, only: [:show, :edit, :update]
    get 'customers/:id/status' => 'public/customers#status'
    patch 'customers/:id' => 'public/customers#change'
    resources :cart_items, only: [:index, :update,:destroy, :create]
    delete 'cart_items' => 'public/cart_items#destroy_all'
    resources :orders, only: [:new, :create, :show]
    post '/orders/confirm' => 'public/orders#confirm'
    get '/orders/decision' => 'public/orders#decision'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  devise_for :admins, controllers: {
    session: 'admin/sessions'
  }
  
  devise_scope :admin do
    get 'admin/sign_in' => 'admin/sessions#new'
  end

  devise_for :customers, controllers: {
    registration: 'public/ragistrations',
    session: 'public/sessions'
  }
  
  devise_scope :customer do 
    get 'customer/sign_up' => 'public/registrations#new'
    get 'customer/sign_in' => 'public/sessions#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
