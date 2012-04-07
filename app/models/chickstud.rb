class Chickstud < Profile
  belongs_to :yentum
  has_and_belongs_to_many :matches
  
  field :endorsement
  field :interested_in
  
  after_create :set_defaults
  before_save :set_name
  
  def set_name
    name = first_name + " " + last_name
  end
  
  def set_defaults
    update_attribute(:interested_in, (gender == "male" ? "Women" : "Men"))
  end
  
end