class YentaFriendController < ApplicationController
  helper_method :profiles
  def dashboard
    @profiles = current_profile.chickstuds
  end
  
  def browse
    @chickstud_profiles = Chickstud._public
    @yenta_profiles = Yentum.all
  end
  
  def explore
    
  end
  
  def connections
    @profiles = current_profile.chickstuds
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
