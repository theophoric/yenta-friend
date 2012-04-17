class ProfilesController < ApplicationController
  helper_method :profile, :profiles, :connections
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    if( profile.is_a?(Chickstud) && profile.private? && yenta_user? && !current_profile.chickstuds.include?( profile))
      redirect_to dashboard_path 
    else
      respond_to do |format|
        format.html {render "profiles/show"}
        format.json { render :json => @profile }
      end
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])
    
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, :notice => 'Profile was successfully created.' }
        format.json { render :json => @profile, :status => :created, :location => @profile }
      else
        format.html { render :action => "new" }
        format.json { render :json => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  
  def invite
    invite = params[:invite]
    profile.update_attribute(:email, invite[:email])
    invite = Notifier.send_invite(profile, invite[:message])
    invite.deliver
    flash[:notice] = "An invititation to join YentaFriend was sent to #{profile.name}.  Check your dashboard for an update when they join!"
  end
  
  def update
    @profile = Profile.find(params[:id])
    _privacy = @profile.privacy
    respond_to do |format|
      if @profile.update_attributes(params[@profile._type.underscore.to_s])
        flash[:notice] = 'Profile was successfully updated.'
        format.js 
        format.html { redirect_to profile_path(@profile), :notice => 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
  
  def create_match
    @profiles = Profile.find(params[:chickstuds].collect{|c| c[1]})
    @match = Match.new(params[:match])
    @match.chickstuds << @profiles
    @match.save!
    respond_to do |format|
      format.js
    end
  end
  
  
  def profile
    @profile ||= params[:id] ? Profile.find(params[:id]) : Profile.new(params[:profile])
  end
  
  def profiles

  end
  
  def connections
    @connections ||= profile.connections
  end
  
end
