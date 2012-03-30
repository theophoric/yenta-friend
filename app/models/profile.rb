class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :profilable, :polymorphic => true
  
  field :name_first
  field :name_last
  field :age, :default => 18
  field :occupation
  field :description
  field :location
  field :hometown
  field :image_url
  field :gender

  delegate :chickstuds, :to => :user

  def fullname
    name_first + " " + name_last
  end
  
end

