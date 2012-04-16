class ConnectionsController < ApplicationController
  def index
    
    @connections = current_profile.observer_connections
  end
end
