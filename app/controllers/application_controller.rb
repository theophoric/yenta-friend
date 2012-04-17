class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :authenticate_active!
  layout :set_layout
  helper_method :notice, :error, :usertype, :current_stable, :current_profile, :current_user_notices, :chickstud_belongs_to_yentum?, :is_current_profile?, :yenta_user?, :current_inbox
  
  def authenticate_active!
    redirect_to welcome_path if (user_signed_in? && current_profile && !current_profile.active)
  end
  
  def facebook_friends
    
  end
  
  def is_current_profile?(profile)
    profile == current_profile
  end
  
  def chickstud_belongs_to_yentum?(profile, yentum = nil)
    yentum ||= current_profile
    profile.yentum_id == yentum._id
  end
  
  def current_user_notices
    (user_signed_in? && current_profile) ? current_profile.notices : []
  end
  
  def notice
    flash[:notice]
  end
  
  def error
    flash[:error]
  end

  def usertype
    (user_signed_in? && current_user.profile) ? current_user.profile._type : "guest"
  end
  
  def yenta_user?
    user_signed_in? && current_user._role == "yentum"
  end
  
  def current_profile
    @current_profile ||= new_user? ? Profile.new : current_user.profile
  end
  
  def current_stable
    @current_stable ||= yenta_user? ? current_user.profile.chickstuds : []
  end
  
  def current_inbox
    current_profile.inbox
  end
  
  def current_conversations
    current_profile.conversations
  end
  
  def new_user?
    user_signed_in? && current_user.profile.nil?
  end
  
  # def current_yentum
  #   @yentum ||= yenta_user? ? current_user
  # end
  
  private
    def set_layout
      (user_signed_in? && current_user.profile.active) ? "user" : "guest"
    end
  
    
end
