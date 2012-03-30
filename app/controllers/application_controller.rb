class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :authenticate_user!
  layout :set_layout
  
  
  
  def notice
    flash[:notice]
  end
  
  def error
    flash[:error]
  end

  def usertype
    user_signed_in? ? current_user._type : "guest"
  end
  
  private
    def set_layout
      usertype
    end
  
    
end
