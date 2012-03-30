class StaticPagesController < ApplicationController
  
  skip_before_filter :authenticate_user!
  
  def project
    
  end
  def login
    redirect_to dashboard_path if user_signed_in? 
  end
  def team
    
  end
end
