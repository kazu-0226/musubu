module NotificationsHelper

    # @notificationsはコントローラでログインのモデルを条件にvisited_typeで判別済み
    # <%= render @notifications %>のnotification
    def notification_form(notification)
    # 文章作成に必要な情報を定義（ログインがUserなら通知を送ってきたShopの情報とChatroomのID）
        if user_signed_in?
            @visiter = notification.shop_visiter
            @room = notification.chat_room_id
        elsif shop_signed_in?
            @visiter = notification.user_visiter
            @room = notification.chat_room_id
        end
        #notification.actionがfollowかdm
        case notification.action
          when "follow" then
            if user_signed_in?
                tag.a(notification.shop_visiter.name, href: shop_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
            elsif shop_signed_in?
                tag.a(notification.user_visiter.full_name, href: user_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
            end
        when "dm" then
            if user_signed_in?
                tag.a(notification.shop_visiter.name, href: shop_path(@visiter), style:"font-weight: bold;")+"から"+tag.a('メッセージ', href: chat_room_path(@room), style:"font-weight: bold;")+"が届きました"
            elsif shop_signed_in?
                tag.a(notification.user_visiter.full_name, href: user_path(@visiter), style:"font-weight: bold;")+"から"+tag.a('メッセージ', href: chat_room_path(@room), style:"font-weight: bold;")+"が届きました"
            end
        end
    end
    
    # 未確認の通知を示す
    def unchecked_notifications
        if user_signed_in?
            # currentIDをキーにFKのvisited_idからチェックされていない通知を検索（ID被りがあるため、typeを条件追加）
            @notifications = current_user.passive_notifications.where(checked: false, visited_type: 'user')
        elsif shop_signed_in?
            @notifications = current_shop.passive_notifications.where(checked: false, visited_type: 'shop')
        end
    end

    # 未確認の件数をカウントする
    def unchecked_count
        # currentIDをキーにFKのvisited_idからチェックされていない通知を検索してカウント（ID被りがあるため、typeを条件追加）
        if user_signed_in?
            @notification_count = current_user.passive_notifications.where(checked: false, visited_type: 'user').count
        elsif shop_signed_in?
            @notification_count = current_shop.passive_notifications.where(checked: false, visited_type: 'shop').count
        end
    end
end
