if Rails.env.production?
    Rails.application.config.session_store :cookie_store, key: '_musubuu_session', expire_after: 1.weeks, domain: 'musubuu.com'
else
    Rails.application.config.session_store :cookie_store, key: '_musubuu_dev_session', domain: 'localhost'
end
  