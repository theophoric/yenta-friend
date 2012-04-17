class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  
  scope :_private, where(:privacy => "private")
  scope :_public, where(:privacy => "public")
  scope :men, where(:gender => "male")
  scope :women, where(:gender => "female")
  scope :men_and_women, all
  scope :inactive, where(:user_id => nil)
  scope :active, where(:user_id.ne => nil)
  
  belongs_to :user
  has_one :inbox
  
  
  has_many :suggestions, :as => :owner
  
  has_and_belongs_to_many :conversations, :inverse_of => :participant
  # connections
  has_and_belongs_to_many :observer_connections, :inverse_of => :observer, :class_name => "Connection"
  has_and_belongs_to_many :partner_connections, :inverse_of => :partner, :class_name => "Connection"
  embeds_many :pictures
  embeds_one :profile_preview
  
  # friendship / connection links
  has_and_belongs_to_many :links, :class_name => "Profile", :inverse_of => :inbound_links
  has_and_belongs_to_many :inbound_links, :class_name => "Profile", :inverse_of => :link

  default_scope asc(:first_name)
  
  field :first_name, :default => ""
  field :last_name, :default => ""
  field :name, :default => ""
  field :age
  field :occupation
  field :description
  field :location
  field :hometown
  field :education
  field :relationship_status
  field :interested_in
  field :username
  field :fb_uid
  field :gender, :default => 'na'
  field :privacy, :default => 'private'
  field :default_image_url
  field :active, :default => false
  
  validates_inclusion_of :privacy, :in => %w{public private}
  
  set_callback(:create, :before) do |document|
    document.build_inbox
    document.build_profile_preview(self.attributes.extract!("name", "first_name","last_name","gender").merge(:image_url => image_url))
  end
  
  set_callback(:save, :after) do |document|
    document.profile_preview.update_fields
  end
  
  def yenta_links
    links.where(:_type => "Yentum")
  end
  
  def chickstud_links
    links.where(:_type => "Chickstud")
  end

  def image_url(size = "square")
    "https://graph.facebook.com/#{fb_uid}/picture?type=#{size}"
  end
  
  def member_since
    "#{Date::MONTHNAMES[created_at.month]} #{created_at.mday}, #{created_at.year}"
  end

  # delegate :retrieve_fb_data, :to => :user
  def private?
    privacy == "private"
  end
  
  def pronoun_obj
    is_male? ? "him" : "her"
  end
  
  def pronoun_subj
    is_male? ? "he" : "she"
  end
  
  def is_male?
    gender == "male"
  end
  
  def is_female?
    !is_male?
  end
end

