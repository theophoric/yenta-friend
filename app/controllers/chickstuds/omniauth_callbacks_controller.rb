class Chickstuds::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    puts request.params.inspect
    @chickstud = Chickstud.find_for_facebook_oauth(request.env["omniauth.auth"], current_chickstud)
    
    if @chickstud.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @chickstud, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_chickstud_registration_url
    end
  end
end