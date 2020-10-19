module NotificationsHelper
    # actionによるメッセージの表示を分ける
    def notification_form(notification)
        if user_signed_in?
            @visiter = notification.shop_visiter
        elsif shop_signed_in?
            @visiter = notification.user_visiter
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
                tag.a(notification.shop_visiter.name, href: shop_path(@visiter), style:"font-weight: bold;")+"からメッセージが届きました"
            elsif shop_signed_in?
                tag.a(notification.user_visiter.full_name, href: user_path(@visiter), style:"font-weight: bold;")+"からメッセージが届きました"
            end
        end
    end
    
    # 未確認の通知を示す
    def unchecked_notifications
        if user_signed_in?
            @notifications = current_user.passive_notifications.where(checked: false, visited_type: 'user')
        elsif shop_signed_in?
            @notifications = current_shop.passive_notifications.where(checked: false, visited_type: 'shop')
        end
    end

    # 未確認の件数をカウントする
    def unchecked_count
        if user_signed_in?
            @notification_count = current_user.passive_notifications.where(checked: false, visited_type: 'user').count
        elsif shop_signed_in?
            @notification_count = current_shop.passive_notifications.where(checked: false, visited_type: 'shop').count
        end
    end
end
