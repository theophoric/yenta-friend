class Notifier < ActionMailer::Base
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
end
