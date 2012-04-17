class ConversationsController < ApplicationController
  def send_message
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.create(params[:message].merge(:profile => current_profile, :from => current_profile.name, :icon_url => current_profile.image_url))
  end
  def show
    @conversation = Conversation.find(params[:id])
  end
end
