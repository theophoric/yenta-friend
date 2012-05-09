class Notifier < ActionMailer::Base
  default :from => "notice@yenta-friend.com"
  def send_invite(from_profile, email, host = "http://beta.yenta-friend.com", name = "", message = "")
    @from_profile = from_profile
    @name = name
    @message = message
    mail(
      :to => email,
      :bcc => "yentafriend@gmail.com",
      :subject => "Yenta-Friend Beta Invite",
			:host => host
    )
  end

	def send_connection(matched_profile, email, connection, host = "http://beta.yenta-friend.com", name = "")
		@matched_profile = matched_profile
		@connection = connection
		@name = name
    mail(
      :to => email,
      :bcc => "yentafriend@gmail.com",
      :subject => "You have a new connection on YentaFriend",
			:host => host
    )
	end
end
