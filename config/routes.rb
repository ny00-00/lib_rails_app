# config/routes.rb
Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  resources :books
  
  # 貸出と返却アクション
  post 'loans/borrow', to: 'loans#borrow', as: 'borrow_book'
  post 'loans/return', to: 'loans#return_book', as: 'return_book'
  
  # その他のルート
  get 'sessions/new', to: 'sessions#new', as: 'login'
  post 'sessions/create', to: 'sessions#create'
  delete 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  resource :session, only: [:new, :create, :destroy]
  
  # ヘルスチェック用ルート（省略）
  get "up" => "rails/health#show", as: :rails_health_check

  root "books#index"
end
