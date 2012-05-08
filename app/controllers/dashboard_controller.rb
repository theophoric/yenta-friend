class DashboardController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:login]
  skip_before_filter :authenticate_active!, :only => [:welcome, :initialize_profile]
  
  before_filter :restrict_access, :only => [:matchbook]
  
  # fiters
  def restrict_access
    redirect_to dashboard_path unless usertype[Regexp.new("yentum", true)]
  end
  
  # actions
  def login
    redirect_to dashboard_path if (user_signed_in? && current_profile && current_profile.active)
  end
  
  def account
    @profile = current_profile
    render 'profiles/show'
  end
  
  def dashboard
    
  end
  
  def welcome
    
  end
  
  def contacts
    
  end
  
  def browse
    
  end
  
  def refresh_connections
    redirect_to :back
  end
  
  def add_catch
    @endorsement = Endorsement.new(params[:endorsement])
    @endorsement.yentum = current_profile
    if @endorsement.save
      flash[:notice] = "#{@endorsement.chickstud.name} has been added to your matchbook!"
    else
      flash[:error] = "There was a problem in adding #{@endorsement.chickstud.name} to your matchbook..."
    end
    redirect_to :back
  end
  
  def suggest_match
    match = params[:match]
    @chickstuds = Profile.find(params[:chickstuds].collect{|c| c[1]})
    approval_ids = match[:approvals].to_a.collect{|a| a[1]}
    @approval_profiles = Profile.find(approval_ids)
    @match = Match.new(:owner => current_profile, :chickstuds => @chickstuds)
    @approval_profiles.each do |profile|
      @match.approvals.build(:profile => profile)
    end
    @match.approvals.build(:profile => current_profile, :approved_at => Time.now)
    @match.save!
    @conversation = Conversation.find(params[:conversation_id])
    @conversation.messages.create(:messageable => @match, :from => current_profile.name, :icon_url => current_profile.image_url)
    redirect_to :back
    # respond_to do |format|
    #   format.html 
    # end

  end
  
  def approve_match
    @match = Match.find(params[:match_id])
    if approval = @match.approvals.where(:profile_id => current_profile._id).first
      approval.update_attribute(:approved_at, Time.now)
    end
    @match.save
    if @match.approvals.pending.none?
      @connection = Connection.create(:partners => @match.chickstuds, :observers => @match.approvals.collect(&:profile))
      @match.chickstuds.map do profile
        profile.links << (@match.chickstuds - profile.to_a)
        profile.save
      end
    end
    redirect_to :back
  end
  def reject_match
    # @match = Match.find(params[:match_id])
    #     if approval = @match.approvals.where(:profile_id => current_profile._id).first
    #       approval.update_attribute(:approved_at, Time.now)
    #     end
    #     @match.save
  end
  
  def inbox
    @conversations = current_profile.conversations
  end
  
  def send_invite
    invite = params[:invite]
    current_user.invites.create(invite)
    Notifier.send_invite(current_profile, invite[:email], invite[:name], invite[:message]).deliver
    flash[:notice] = "Invitation to #{invite[:name]} (#{invite[:email]}) has been sent!"
  end

  def endorsements
    
  end

  def matchbook
    @endorsements = current_profile.endorsements
  end
  
  def initialize_profile
    @profile = current_user.profile
    @profile.update_attributes(:_type => params[:profile][:_type], :active => true)
    @linked_profiles = current_user.get_linked_profiles
    @profile.links << @linked_profiles
    @profile.save
    @profile.notices.create(:header => "Welcome to Yenta Friend", :body => "You have signed up as a #{@profile._type[/Yentum/] ? "Yenta" : "Catch" }.", :icon_url => @profile.fb_image_url)
    if @linked_profiles.any?
      @profile.notices.create(:header => "You have friends on Yenta!", :message => "We have found #{@linked_profiles.count} of your friends already on YentaFriend.  Click on your Contacts tab to view their profiles.", :href => contacts_path, :icon_url => 'icon_large.png')
      @linked_profiles.each do |profile|
        profile.links << @profile
        profile.notices.create(:header => "#{@profile.name} has joined the site as a #{@profile._type[/Yentum/] ? "Yenta" : "Catch" }", :message => "Check out #{@profile.pronoun_poss} profile!", :href => profile_path(@profile._id), :icon_url => @profile.image_url)
        profile.save
      end
    end
    redirect_to dashboard_path
  end
end
