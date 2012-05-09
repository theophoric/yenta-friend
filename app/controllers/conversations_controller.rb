class ConversationsController < ApplicationController
  def send_message
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.create(params[:message].merge(:profile => current_profile, :from => current_profile.name, :icon_url => current_profile.image_url))
    
    # might as well just send it out over the message channel...
    
    if @message
      # html = render :partial => "posts/#{@post._type.underscore}"
      # Pusher["conversation-#{conversation._id}"].trigger("message", {:html => html})
      # for profile in @conversation.participants do
      #   html = render :partial => "posts/#{@post._type.underscore}"
      #   Pusher["private-#{profile._id}"].trigger('message', {:conversation_id => @conversation._id, :html => html.to_s})
      # end
    end
  end
  def show
    @conversation = Conversation.find(params[:id])
# change this later
		alter = @conversation.participants - current_profile.to_a
		redirect_to profile_path(alter.first)
  end
end
