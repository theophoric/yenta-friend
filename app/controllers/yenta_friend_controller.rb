class YentaFriendController < ApplicationController
  helper_method :profiles
  def dashboard
    @profiles = current_stable
    puts request.location
  end
  
  def stable
    
  end
  
  def browse
    @chickstud_profiles = Chickstud._public
    @yenta_profiles = Yentum.all
  end
  
  def explore
    
  end
  
  def inbox
    
  end
  
  def connections
    @profiles = current_stable
  end
  
  def chickstud_connections
    @profile = params[:id].nil? ? current_profile : Profile.find(params[:id])
    @connections_array = @profile.connections
  end
  
  def profiles
    
  end
  
end
