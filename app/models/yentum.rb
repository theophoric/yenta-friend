class Yentum < Profile
  
  has_many :chickstuds
  has_many :suggestions
  field :privacy, :default => "public"
  
end