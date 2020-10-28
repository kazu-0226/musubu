class AutoMailDeliveryMailer < ApplicationMailer

  def auto_delivery_mail
    # 配信対象のメールを取得
    time = Time.current
    @auto_mails = AutoMailDelivery.where(is_sent: false).where("reservation_time BETWEEN ? AND ?", time.since(-1.minute), time.since(1.minute) )
    if @auto_mails.present?
      mail_target(@auto_mails)
    end
  end
   
  def mail_target(auto_mails)
    auto_mails.each do |am|
      # 配信対象のターゲット別に分岐をする
      if am.target_type == "user"
        subject = am.subject
        @content = am.content
        user_target = User.all.pluck(:email)
      elsif am.target_type == "shop"
        subject = am.subject
        @content = am.content
        shop_target = Shop.all.pluck(:email)
      elsif am.target_type == "all"
        subject = am.subject
        @content = am.content
        all_target = User.all.pluck(:email) && Shop.all.pluck(:email)
      end
      mail(subject: subject , to: [user_target, shop_target, all_target] ) do |format|
        if am.mail_type
          format.html # HTMLメールを指定
        else
        format.text # テキストメールを指定
        end
      end
      # 配信が完了したらステータス変更
      am.update_attributes(is_sent: true)
    end
  end
  
end
