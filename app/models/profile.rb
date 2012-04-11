class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  
  scope :_private, where(:privacy => "private")
  scope :_public, where(:privacy => "public")
  scope :men, where(:gender => "male")
  scope :women, where(:gender => "female")
  scope :men_and_women, all
  
  belongs_to :user
  has_one :inbox
  has_many :suggestions, :as => :owner  
  embeds_many :pictures

  default_scope asc(:first_name)
  
  field :first_name
  field :last_name
  field :name
  field :age
  field :occupation
  field :description
  field :location
  field :hometown
  field :interested_in
  field :username
  field :image_url
  field :fb_uid
  field :gender, :default => 'na'
  field :privacy, :default => 'private'
  
  validates_inclusion_of :privacy, :in => %w{public private}
  after_create :create_inbox

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

