class YentaFriendController < ApplicationController
  helper_method :profiles
  def dashboard
    @profiles = current_profile.chickstuds
    @notices = current_user.notices
  end
  
  def browse
    @profiles ||= Profile._public    
  end
  
  def explore
    
  end
  
  def profiles
    
  end
end
