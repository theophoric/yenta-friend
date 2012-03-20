class StaticPagesController < ApplicationController
  
  skip_before_filter :authenticate_user!
  
  def project
    
  end
  
  def team
    
  end
end
