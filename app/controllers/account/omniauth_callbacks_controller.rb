class Account::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @account = Account.from_omniauthFacebook(request.env["omniauth.auth"])

    if @account.persisted?
      sign_in_and_redirect @account, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_account_registration_url
    end
  end

  def twitter
    @account = Account.from_omniauthTwitter(request.env["omniauth.auth"].except("extra"))
    if @account.persisted?
      sign_in_and_redirect @account, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_account_registration_url
    end
  end

  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @account = Account.from_omniauthGoogle(request.env["omniauth.auth"])

    if @account.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @account, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except(:extra) #Removing extra as it can overflow some session stores
      redirect_to new_account_registration_url, alert: @account.errors.full_messages.join("\n")
    end
  end

  def failure
    redirect_to root_path
  end

end
