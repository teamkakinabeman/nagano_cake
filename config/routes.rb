Rails.application.routes.draw do
  root :to =>"public/homes#top"
  get '/about' =>"public/homes#about"
  scope module: :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
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
