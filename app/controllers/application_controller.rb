class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  layout :set_layout
  helper_method :notice, :error, :usertype, :current_stable
  
  
  def facebook_friends
    
  end
  
  def notice
    flash[:notice]
  end
  
  def error
    flash[:error]
  end

  def usertype
    user_signed_in? ? current_user._role : "guest"
  end
  
  def yenta_user?
    user_signed_in? && current_user._role == "yentum"
  end
  
  def current_profile
    @current_profile ||= user_signed_in? ? current_user.profile : false
  end
  
  def current_stable
    @current_stable ||= yenta_user? ? current_user.profile.chickstuds : []
  end
  
  # def current_yentum
  #   @yentum ||= yenta_user? ? current_user
  # end
  
  private
    def set_layout
      usertype
    end
  
    
end
