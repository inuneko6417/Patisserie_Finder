Rails.application.routes.draw do
  get "profiles/show"
  get "profiles/edit"
  root "pages#home"
  resources :users, only: [ :new, :create ] # ユーザー登録に必要なルートのみ追加
  resources :posts, only: [ :index, :show, :new, :create ] do
    collection do
      get :ranking
    end
    resources :comments, only: %i[create edit destroy], shallow: true
  end
  resources :patisseries, only: [ :index, :show ]
  resource :profile, only: %i[show edit update]

  get "signup", to: "users#new", as: :signup # 新規登録ページ用のカスタムルート
  get "login", to: "sessions#new" # ログインページ（後で実装）
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "terms", to: "pages#terms", as: :terms
  get "privacy", to: "pages#privacy", as: :privacy
  get "how_to_use", to: "pages#how_to_use"
end
