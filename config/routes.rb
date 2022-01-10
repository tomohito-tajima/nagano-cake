Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #管理者側
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #顧客者側
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  namespace :admin do
    get '/admin' => 'homes#top'
    resources :items, :except => :destroy
    resources :genres, :except => [:new, :show, :destroy]
    resources :customers, :except => [:new, :create, :destroy]
    resources :orders, :only => [:show, :update]
    resources :order_items, :only => :update
  end

end