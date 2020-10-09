Rails.application.routes.draw do
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
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # omniauth_callbackコントローラーを介し、APIにリクエストを送る。

  #店舗用デバイス
  devise_for :shops

  #管理者用ルーティング 
  namespace :admins do
    get 'homes/top'
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
  
  #問い合わせルーティング  
  get   'inquiry'         => 'inquiry#index'
  post  'inquiry/confirm' => 'inquiry#confirm'
  post  'inquiry/thanks'  => 'inquiry#thanks'

  # resources :chat_rooms, only: [:show, :create] do
  #   resources :chat_messages, only:[:create]
  # end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
