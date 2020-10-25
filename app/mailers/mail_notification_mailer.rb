class MailNotificationMailer < ApplicationMailer
  def check_notice_mail
    @url = "https://musubuu.com/"

    users_with_unckecked_notices = User.all.select do |user|
      user.passive_notifications.where(visited_id: user.id, visited_type: 'user', checked: false).count >= 3
    end

    users_with_unckecked_notices_mailsunckecked_notices_mails = users_with_unckecked_notices.pluck(:email)
    

    shops_with_unckecked_notices = Shop.all.select do |shop|
      shop.passive_notifications.where(visited_id: shop.id, visited_type: 'shop', checked: false).count >= 3
    end
    
    shops_with_unckecked_notices_mailsunckecked_notices_mails = shops_with_unckecked_notices.pluck(:email)
    
    binding.pry
    mail(subject: "未読の通知が3件以上あります", to: shops_with_unckecked_notices_mailsunckecked_notices_mails)
    mail(subject: "未読の通知が3件以上あります", to: users_with_unckecked_notices_mailsunckecked_notices_mails)
  end
end
