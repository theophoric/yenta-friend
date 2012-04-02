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
  
  def create_match
    puts params[:match]
    match = Match.new
    chickstuds = Chickstuds.find([params[:partner1], params[:partner2]])
    match.chickstuds << chickstuds
    match.save
  end
end
