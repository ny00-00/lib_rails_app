Rails.application.routes.draw do
  root "books#index"

  # セッション関連
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # 追加：GETでもlogoutができるように
  match 'logout', to: 'sessions#destroy', via: [:get, :delete]

  resources :books

  # 貸出・返却アクション
  post 'loans/borrow', to: 'loans#borrow', as: 'borrow_book'
  patch 'loans/:id/return_book', to: 'loans#return_book', as: 'return_book'

  # ヘルスチェック（必要なら）
  get 'up' => 'rails/health#show', as: :rails_health_check
end
