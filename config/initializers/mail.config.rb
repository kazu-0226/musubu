Rails.application.configure do
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        port: 587,
        address: 'smtp.gmail.com',
        domain: 'smtp.gmail.com',
        user_name: ENV['SEND_MAIL_ADRESS'],
        password: ENV['SEND_MAIL_PASS'],
        enable_starttls_auto: true
    }
end