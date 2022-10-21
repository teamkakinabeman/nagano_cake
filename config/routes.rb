Rails.application.routes.draw do
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  root :to =>"public/homes#top"
  get '/about' =>"public/homes#about"
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  namespace :public do

  end

  namespace :admin do
    root :to => "homes#top"
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
