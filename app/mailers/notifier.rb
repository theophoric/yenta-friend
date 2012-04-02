class Notifier < ActionMailer::Base
  default :from => "barack.o@whitehouse.gov"
  
  def invite_chickstud(chickstud)
    @chickstud = chickstud
    mail(
      :to => chickstud.email,
      :bcc => "",
      :subject => "Join Yenta-Friend1"
    )
  end
end
