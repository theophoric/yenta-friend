class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user
  
  field :name_first
  field :name_last
  field :age, :default => 18
  field :occupation
  field :description
  field :location
  field :hometown
  field :image_url
  field :gender, :default => 'na'
  field :privacy, :default => 'private'
  
  # delegate :retrieve_fb_data, :to => :user

  def fullname
    name_first + " " + name_last
  end
  
end

