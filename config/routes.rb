Rails.application.routes.draw do

  #管理者用ルーティング
  devise_for :admins
  namespace :admins do
    get 'homes/top'
    resources :users, only: [:index, :edit, :show, :update]
    resources :shops, only: [:index, :edit, :show, :update]
  end

  #店舗用ルーティング
  devise_for :shops
  scope module: :shops do
    resource :shops, only: [:edit, :update] do
      member do
        get 'shops/mypage'
        put 'shops/withdraw'
      end
    end
    resources :users, only: [:index, :show] do
      collection do
        #検索用に追加
        post 'search'
      end
    end
  end

  #会員用ルーティング
  devise_for :users
  scope module: :users do
    resource :users, only: [:edit, :update] do
      member do
        get 'users/mypage'
        put 'users/withdraw'
      end
    end
    resources :shops, only: [:index, :show] do
      collection do
        #検索用に追加
        post 'search'
      end
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
