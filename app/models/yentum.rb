class Yentum < Profile
  has_many :chickstuds
  field :privacy, :default => "public"
  
end