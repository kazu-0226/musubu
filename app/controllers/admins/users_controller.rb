class Admins::UsersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_user, only: [:show, :edit, :update, :withdraw]

    def index
        @users = User.all.order(id: "DESC").page(params[:page]).per(5)
    end

    def show
        
    end

    def edit
        
    end

    def update
        if @user.update(user_params)
            redirect_to admins_user_path(@user)
        else
            render :edit
        end
    end

    def search
        @content = params['content']
        @prefecture_code = params['prefecture_code']
        @category_ids = params['category_ids']
        @users = search_user(@content, @prefecture_code, @category_ids).page(params[:page]).per(5)
        render :index
      end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :prefecture_code, :phone_number, :email, :hope_prefecture_code, :category_id, :personality, :user_image, :pr, :is_deleted )
    end

    def search_user(content, prefecture_code, category_ids)
        users = User.all
        #「where!」で例外処理を利用して、present?でtrueの検索をして「return shops」で値を返す
        if content.present?
          users.where!(['first_name LIKE ? OR last_name LIKE ? OR first_name_kana LIKE ? OR last_name_kana LIKE ? OR pr LIKE ?', "%#{content}%", "%#{content}%", "%#{content}%", "%#{content}%", "%#{content}%"])
        end
        if prefecture_code.present?
          users.where!(hope_prefecture_code: prefecture_code)
        end
        if category_ids.present?
          users.where!(category_id: category_ids)
        end
        return users
    end
end
