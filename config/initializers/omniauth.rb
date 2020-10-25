Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], skip_jwt: true
    #on_failure { |env| AuthenticationsController.action(:failure).call(env) }
    #{:provider_ignores_state => true}
end