class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  
  scope :_private, where(:privacy => "private")
  scope :_public, where(:privacy => "public")
  scope :men, where(:gender => "male")
  scope :women, where(:gender => "female")
  scope :men_and_women, all
  
  belongs_to :user
  
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
  field :image_url, :default => "http://www.neuromance.co.za/wp-content/uploads/2009/05/defaulticon.jpg"
  field :gender, :default => 'na'
  field :privacy, :default => 'private'
  
  validates_inclusion_of :privacy, :in => %w{public private}

  # delegate :retrieve_fb_data, :to => :user
  def private?
    privacy == "private"
  end
  
end

