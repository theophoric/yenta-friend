class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  
  scope :_private, where(:privacy => "private")
  scope :_public, where(:privacy => "public")
  
  belongs_to :user
  
  field :first_name
  field :last_name
  field :age
  field :occupation
  field :description
  field :location
  field :hometown
  field :image_url, :default => "http://www.neuromance.co.za/wp-content/uploads/2009/05/defaulticon.jpg"
  field :gender, :default => 'na'
  field :privacy, :default => 'private'
  
  validates_inclusion_of :privacy, :in => %w{public private}
  
  # delegate :retrieve_fb_data, :to => :user
  def private?
    privacy == "private"
  end

  def fullname
    first_name + " " + last_name
  end
  
end

