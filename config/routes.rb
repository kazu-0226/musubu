Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  mount ActionCable.server => '/cable'
  root 'homes#top'

  #非ログイン時TOP
  get 'homes/top'
 
  #ゲストログイン
  post '/homes/guest_user_sign_in', to: 'homes#new_guest_user'
  post '/homes/guest_shop_sign_in', to: 'homes#new_guest_shop'

  #管理者用デバイス
  devise_for :admins

  #会員用デバイス
  devise_for :users
  # omniauth_callbackコントローラーを介し、APIにリクエストを送る。
  devise_scope :user do
    #get "/auth/:provider/callback" => "users/omniauth_callbacks#google_oauth2"
    get "/auth/google_oauth2/callback" => "users/omniauth_callbacks#google_oauth2"
    get "/auth/google_oauth2" => "users/omniauth_callbacks#passthru", as: :google_oauth
  end

  #店舗用デバイス
  devise_for :shops
  # devise_scope :shop do
  #   #get "/auth/:provider/callback" => "users/omniauth_callbacks#google_oauth2"
  #   get "shops/auth/google_oauth2/callback" => "shops/omniauth_callbacks#google_oauth2"
  #   get "/auth/google_oauth2" => "shops/omniauth_callbacks#passthru", as: :shop_google_oauth
  # end

  #管理者用ルーティング 
  namespace :admins do
    get 'homes/top'

    resources :auto_mail_deliveries, only: [:index, :edit, :show, :update] do
      collection do
        get 'auto_mail_deliveries/form'
        post 'auto_mail_deliveries/confirm'
        post 'auto_mail_deliveries/completed'
      end
    end

    resources :news, only: [:index, :edit, :show, :update] do
      collection do
        get 'news/form'
        post 'news/confirm'
        post 'news/completed'
      end
    end

    resources :users, only: [:index, :edit, :show, :update] do
      collection do
        #検索用に追加
        get 'search'
      end
    end

    resources :shops, only: [:index, :edit, :show, :update] do
      collection do
        get 'search'
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
      get 'search'
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
      get 'search'
    end
  end

  #チャットルーティング 
  resources :chat_rooms, only: [:show, :create, :index]
  resources :chat_messages, only:[:create]

  resources :notifications, only:[:index]
  
  #問い合わせルーティング  
  get   'inquiry'         => 'inquiry#index'
  post  'inquiry/confirm' => 'inquiry#confirm'
  post  'inquiry/thanks'  => 'inquiry#thanks'

  # resources :chat_rooms, only: [:show, :create] do
  #   resources :chat_messages, only:[:create]
  # end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
