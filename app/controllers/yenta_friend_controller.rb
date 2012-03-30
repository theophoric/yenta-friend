class YentaFriendController < ApplicationController
  helper_method :profiles
  def dashboard
    @notices = current_user.notices
  end
  
  def browse
    
  end
  
  def explore
    
  end
  
  def profiles
    @profiles ||= Chickstud.all
  end
end
