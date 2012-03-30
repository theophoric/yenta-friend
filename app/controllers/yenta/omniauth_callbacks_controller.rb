class Yenta::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    puts request.params.inspect
    @yentum = Yentum.find_for_facebook_oauth(request.env["omniauth.auth"], current_yentum)
    
    if @yentum.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @yentum, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_yentum_registration_url
    end
  end
end