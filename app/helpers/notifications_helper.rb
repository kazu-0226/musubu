module NotificationsHelper

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
            tag.a(notification.visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:users_item_path(notification.item_id), style:"font-weight: bold;")+"にいいねしました"
        end
    end
    
end
