Rails.application.routes.draw do

  root 'homes#top'

  #非ログイン時TOP
  get 'homes/top'
  get 'homes/about'
  get 'homes/new'
  get 'homes/login'

  #管理者用ルーティング
  devise_for :admins
  #会員用ルーティング
  devise_for :users
  #店舗用ルーティング
  devise_for :shops

  namespace :admins do
    get 'homes/top'
    resources :users, only: [:index, :edit, :show, :update]
    resources :shops, only: [:index, :edit, :show, :update]
  end

  resources :shops, only: [:index, :edit, :show, :update] do
    member do
      put 'withdraw'
    end
    collection do
      #検索用に追加
      post 'search'
    end
  end

  resources :users, only: [:index, :edit, :show, :update] do
    member do
      put 'withdraw'
    end
    collection do
      #検索用に追加
      post 'search'
    end
  end

  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
