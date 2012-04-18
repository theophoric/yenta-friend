class ConnectionsController < ApplicationController
  def index
    
    @connections = current_profile.observer_connections
  end
  def show
    @connection = Connection.find(params[:id])
    @conversation = @connection.conversation.nil? ? @connection.generate_conversation : @connection.conversation
  end
end
