Rails.application.routes.draw do

  root :to =>"public/homes#top"
  get '/about' =>"public/homes#about"
  resources :items, only: [:index,:show]


  scope module: :public do
    # 顧客側のマイページ,登録情報編集&更新
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    # 顧客側の退会確認画面,退会処理
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    # 顧客側のカート画面
    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'


    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks' => 'orders#thanks'

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    resources :orders, only: [:new, :create, :index]

  end



  namespace :admin do
    root :to => "homes#top"
    resources :items
    resources :genres
    resources :customers, only: [:index, :edit, :update, :show]
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip:[:registrations, :passwords],controllers:{
    sessions: "admin/sessions"
  }

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end