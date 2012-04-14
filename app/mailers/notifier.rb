class Notifier < ActionMailer::Base
  default :from => "notice@yenta-friend.com"
  def send_invite(profile, message)
    @profile = profile
    @message = message
    mail(
      :to => profile.email,
      :bcc => "",
      :subject => "Yenta-Friend Beta Invite"
    )
  end
end
