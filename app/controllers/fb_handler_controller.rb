class FbHandlerController < ApplicationController
  respond_to :js
  require('typhoeus')
  def request_callback
    puts params["to"]
    fb_uids = params["to"]
    puts '[FB_UID]: ' + fb_uids.inspect
    chickstuds = []
    if user_signed_in? && current_user._role["yentum"]      
      fb_uids.each do |fb_uid|
        fb_user_data = JSON.parse(Typhoeus::Request.get('https://graph.facebook.com/' + fb_uid).body)
        unless current_profile.chickstuds.where(:fb_uid => fb_user_data["id"]).exists?
          puts "FBUSER" + fb_user_data.inspect
          chickstud = Chickstud.find_or_initialize_by(fb_user_data.except("id").merge(:fb_uid => fb_user_data["id"], :image_url => "http://graph.facebook.com/#{fb_user_data["username"]}/picture?type=square",  :yentum_id => current_profile._id))
          if chickstud.save
            current_user.notices.create!(:header => "#{chickstud.name} has been added to your stable.", :icon_url => chickstud.image_url, :body => "Try to set #{chickstud.gender[/male/] ? "him" : "her"} up!", :notice_type => "social", :link_to => profile_path(chickstud))
            chickstuds << chickstud
          end
        end
      end
      current_profile.chickstuds << chickstuds
      current_profile.save
    end
    @profiles = chickstuds
    respond_with @profiles
  end
  
end