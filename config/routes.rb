Rails.application.routes.draw do
  devise_for :shops
  scope module: :shops do
    
  end


  #管理者用ルーティング
  devise_for :admins
  namespace :admins do

  end

  #会員用ルーティング
  scope module: :users do
    
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
