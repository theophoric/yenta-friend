class DashboardController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:login]
  skip_before_filter :authenticate_active!, :only => [:welcome, :initialize_profile]
  
  before_filter :restrict_access, :only => [:matchbook]
  
  # fiters
  def restrict_access
    redirect_to dashboard_path unless usertype[Regexp.new("yentum", true)]
  end
  
  
  # actions
  def login
    
  end
  
  def dashboard
    
  end
  
  def welcome
    
  end
  
  def browse
    
  end
  
  def inbox
    @conversations = current_profile.conversations
  end
  
  def matchbook
    @matchbook = current_profile.endorsements.collect(&:chickstud)
  end
  
  def initialize_profile
    @profile = current_user.profile
    @profile.update_attributes(params[:profile].merge(:active => true))
    @linked_profiles = current_user.get_linked_profiles
    @profile.links << @linked_profiles
    @profile.save
    current_user.notices.create(:header => "Welcome to Yenta Friend", :body => "You have signed up as a #{@profile._type}.")
    if @linked_profiles.any?
      current_user.notices.create(:header => "We have found #{@linked_profiles.count} of your friends already on YentaFriend.  Click on your Contacts tab to view their profiles.", :href => browse_url)
    end
    redirect_to dashboard_path
  end
end
