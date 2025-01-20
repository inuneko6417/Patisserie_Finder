Rails.application.routes.draw do
  root "pages#home"
  resources :users, only: [ :new, :create ] # ユーザー登録に必要なルートのみ追加
  resources :posts, only: [ :index, :show, :new, :create ]
  resources :patisseries, only: [ :index, :show ]

  get "signup", to: "users#new", as: :signup # 新規登録ページ用のカスタムルート
  get "login", to: "sessions#new" # ログインページ（後で実装）
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
