class Yentum < Profile
  
  has_many :chickstuds
  has_many :suggestions
  has_and_belongs_to_many :connections
  field :privacy, :default => "public"
  
end