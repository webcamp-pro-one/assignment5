Rails.application.routes.draw do
  namespace :admin do
    get 'oders/index'
    get 'oders/show'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
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
