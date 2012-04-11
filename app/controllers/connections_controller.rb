class ConnectionsController < ApplicationController
  def index
    
  end
  
  def create
    
  end
  
  def connections
    @connections ||= current_profile.connections
  end
end
