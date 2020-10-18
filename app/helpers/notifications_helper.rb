module NotificationsHelper

    def notification_form(notification)
        if user_signed_in?
            @visiter = notification.visiter.where(visiter_type: "shop")
        elsif shop_signed_in?
            @visiter = notification.visiter.where(visiter_type: "shop")
        end
        #notification.actionがfollowかdm
        case notification.action
          when "follow" then
            if user_signed_in?
                tag.a(notification.visiter.user.full_name, href: user_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
            elsif shop_signed_in?
                tag.a(notification.visiter.shop.name, href: ahop_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
            end
        when "dm" then
            tag.a(notification.visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:users_item_path(notification.item_id), style:"font-weight: bold;")+"にいいねしました"
        end
    end
end
