class Yentum < Profile
  
  has_many :chickstuds
  has_many :suggestions, :dependent => "destroy"
  has_many :endorsements, :dependent => "destroy"
  field :privacy, :default => "public"
  
  
  def connections
    observer_connections
  end
end