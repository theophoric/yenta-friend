class Chickstud < Profile
  
  belongs_to :yentum
  has_and_belongs_to_many :matches
  has_many :endorsements, :dependent => "destroy"
  
  field :interested_in
  field :about
  field :invited, :default => false
  
  after_create :set_defaults
  before_save :set_name
  
  def connections
    partner_connections
  end

  def set_name
    self.name = first_name + " " + last_name
  end
  
  def format_fields

  end
  
  def set_defaults
    update_attribute(:interested_in, (interested_in.nil? ? (gender == "male" ? "women" : "men") : interested_in.gsub(" ", "_").underscore))
  end
  
end