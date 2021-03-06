Rails.application.routes.draw do
  #顧客者側
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
  }

  #管理者側
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admins/sessions"
  }



  #管理者側
  # URL /admin/sign_in ...
  # devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  #   sessions: "admins/sessions"
  # }


  # #顧客者側
  # # URL /customers/sign_in ...
  # devise_for :customers, skip: [:passwords], controllers: {
  #   registrations: "customers/registrations",
  #   sessions: 'customers/sessions'
  # }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do
    get '/admin' => 'homes#top'
    resources :items, :except => :destroy
    resources :genres, :except => [:new, :show, :destroy]
    resources :customers, :except => [:new, :create, :destroy]
    resources :orders, :only => [:show, :update, :index]
    resources :order_items, :only => :update
  end

  scope module: :customers do
    root to: 'homes#top'
    get 'home/about' => 'homes#about'
    resources :items, :only => [:index, :show]
    resources :cart_items, :only => [:create, :index, :destroy, :update] do
       collection do #idは必要がないため、memberではなくcollection
       delete 'destroy_all'
       end
    end
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, :only => [:new, :create, :index, :show]
    patch 'customers' => 'customers#update'
    get 'customers/edit' => 'customers#edit'
    get 'customers/current_customer' => 'customers#show'
    get 'customers/check' => 'customers#check'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :shippings, :except => [:new, :show]
  end

end