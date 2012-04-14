class ConnectionsController < ApplicationController
  def index
    
  end
  
  def create
    profile_ids = params[:profiles].to_a.collect{|key, value| value}
    profiles = Profile.find(profile_ids)
    auth_profiles = profiles - current_profile.to_a
    @connection = Connection.create(:profiles => profiles, :approved => auth_profiles.none?)
    suggestion = @connection.create_connection_suggestion
    auth_profiles.to_a.each do |_profile|
      suggestion.approvals.create(:profile => _profile)
    end
    flash[:notice] = "Connection suggestion has been sent."
  end
  
  def connection
    @connection ||= params[:id].nil? ? Connection.new(params[:connection]) : Connection.find(params[:id])
  end
  
  def connections

  end
  
  def profiles
    @profiles ||= connection.profiles
  end
end
