# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  def passthru
    binding.pry
    super
  end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  # def google_oauth2
  #  
  #   # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   if  request.env["omniauth.params"]["type"] == "user"
  #     @user = User.from_omniauth(request.env['omniauth.auth'])
  #     if @user.persisted?
  #       flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
  #       sign_in_and_redirect @user, event: :authentication
  #     else
  #       session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
  #       redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
  #     end
  #   elsif request.env["omniauth.params"]["type"] == "shop"
  #     @shop = Shop.from_omniauth(request.env['omniauth.auth'])
  #     if @shop.persisted?
  #       flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
  #       sign_in_and_redirect @shop, event: :authentication
  #     else
  #       session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
  #       redirect_to new_shop_registration_url, alert: @shop.errors.full_messages.join("\n")
  #     end
  #   end
  # end

   def google_oauth2
    target_model, path = get_target_data
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    if target_model.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect target_model, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to path, alert: target_model.errors.full_messages.join("\n")
    end
   end

  private

    def get_target_data
      type = request.env["omniauth.params"]["type"]
      if type == "user"
        target_model = User.from_omniauth(request.env['omniauth.auth'])
        path = new_user_registration_url
      elsif type == "shop"
        target_model = Shop.from_omniauth(request.env['omniauth.auth'])
        path = new_shop_registration_url
      end
      return target_model, path
    end

end
