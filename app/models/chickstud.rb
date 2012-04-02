class Chickstud < Profile
  belongs_to :yentum
  has_and_belongs_to_many :matches
  
  field :recommendation
  
end