class FbHandlerController < ApplicationController
  require('typhoeus')
  def request_callback
    fb_uids = params["to"]
    puts '[FB_UID]: ' + fb_uids.inspect

    chickstuds = []
    if user_signed_in? && current_user._role["yenta"]      
      fb_uids.each do |fb_uid|

        fb_user_data = JSON.parse(Typhoeus::Request.get('https://graph.facebook.com/' + fb_uid).body)
        puts "FBUSER" + fb_user_data.inspect
        chickstud = Chickstud.find_or_initialize_by(fb_user_data.except("id").merge("fb_uid" => fb_user_data["id"], :yentum_id => current_profile._id))
        if chickstud.save
          chickstuds << chickstud
        end
      
      end
    current_profile.chickstuds << chickstuds
    end
    respond_to do |format|
      format.html
      format.xml  { render :xml => chickstuds }
      format.json  { render :json => chickstuds }
    end
  end
  
end