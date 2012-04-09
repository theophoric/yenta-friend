class Notifier < ActionMailer::Base
  default :from => "barack.o@whitehouse.gov"
  
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
