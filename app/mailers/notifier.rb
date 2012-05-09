class Notifier < ActionMailer::Base
	default_url_options[:host] = request.host_with_port
  default :from => "notice@yenta-friend.com"
  def send_invite(from_profile, email, name = "", message = "")
    @from_profile = from_profile
    @name = name
    @message = message
    mail(
      :to => email,
      :bcc => "yentafriend@gmail.com",
      :subject => "Yenta-Friend Beta Invite"
    )
  end

	def send_connection(matched_profile, email, connection, name = "")
		@matched_profile = matched_profile
		@connection = connection
		@name = name
    mail(
      :to => email,
      :bcc => "yentafriend@gmail.com",
      :subject => "You have a new connection on YentaFriend"
    )
	end
end
