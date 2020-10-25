class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@musubuu.com',
      to: ENV['SEND_MAIL_ADRESS'],
      subject: 'お問い合わせ通知'
    )
  end
end
