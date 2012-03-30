class Chickstud
  include Mongoid::Document
  
  has_one :profile, :as => :profilable
  belongs_to :yentum
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  ## Database authenticatable
  field :email,              :type => String, :null => false, :default => ""
  field :encrypted_password, :type => String, :null => false, :default => ""

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  # PERSONAL DATA (from fb)
  field :name_first
  field :name_last
  
  field :hometown
  field :fb_link 
  field :location
  field :gender
  
  field :image_url
  field :fb_uid
  
  ## Encryptable
  # field :password_salt, :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  class << self
    
    def find_for_facebook_oauth(access_token, signed_in_resource=nil)
      
      puts "[FB ACCESS TOKEN]: " + access_token.inspect
      data = access_token.extra.raw_info
      info = access_token.info
      puts "[FB USER DATA]: " + data.inspect  
      if chickstud = Chickstud.where(:email => data.email).first
        chickstud
      else # Create a user with a stub password. 
        chickstud = Chickstud.create!(:email => data.email, :password => Devise.friendly_token[0,20], :name_first => data.first_name, :name_last => data.last_name,  :fb_uid => access_token.uid, :image_url => info.image) 
        chickstud.create_profile(chickstud.attributes.except("_id","_type", "encrypted_password", "password", "updated_at", "sign_in_count").merge(:gender => data.gender, :location => data.location.name, :hometown => data.hometown.name))
        return chickstud
      end
    end
    
    def new_with_session(params, session)
      super.tap do |chickstud|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          chickstud.email = data["email"]
        end
      end
    end
    
  end
  
end
