Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root 'homes#top'

  #非ログイン時TOP
  get 'homes/top'
  get 'homes/about'
  get 'homes/new'
  get 'homes/login'

  #管理者用デバイス
  devise_for :admins
  #会員用デバイス
  devise_for :users
  #店舗用デバイス
  devise_for :shops

  #管理者用ルーティング 
  namespace :admins do
    get 'homes/top'
    resources :users, only: [:index, :edit, :show, :update] do
      collection do
        #検索用に追加
        post 'search'
      end
    end
    resources :shops, only: [:index, :edit, :show, :update] do
      collection do
        post 'search'
      end
    end
    resources :chat_rooms, only: [:index]
    resources :categories, only: [:index, :destroy] do
      collection do
        post 'g_category'
      end
    end
  end

  #店舗ルーティング 
  resources :shops, only: [:index, :edit, :show, :update] do
    resource :user_followings, only: [:create, :destroy]
    member do
      put 'withdraw'
      get 'followings'
      get 'followers'
    end
    collection do
      #検索用に追加
      post 'search'
    end
  end

  #会員ルーティング 
  resources :users, only: [:index, :edit, :show, :update] do
    resource :shop_followings, only: [:create, :destroy]
    member do
      put 'withdraw'
      get 'followings'
      get 'followers'
    end
    collection do
      #検索用に追加
      post 'search'
    end
  end

  #チャットルーティング 
  resources :chat_rooms, only: [:show, :create, :index]
  resources :chat_messages, only:[:create]
  
  #問い合わせルーティング  
  get   'inquiry'         => 'inquiry#index'
  post  'inquiry/confirm' => 'inquiry#confirm'
  post  'inquiry/thanks'  => 'inquiry#thanks'

  # resources :chat_rooms, only: [:show, :create] do
  #   resources :chat_messages, only:[:create]
  # end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
