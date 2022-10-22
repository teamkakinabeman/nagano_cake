Rails.application.routes.draw do

  root :to =>"public/homes#top"
  get '/about' =>"public/homes#about"
  resources :items, only: [:index,:show]

  namespace :public do


  end


  scope module: :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
      # resources :customers, only: [:show,:edit,:update]
  end

  namespace :admin do
    root :to => "homes#top"
    resources :items
    resources :genres
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
