class Yentum < Profile
  
  has_many :chickstuds
  has_many :suggestions
  has_many :endorsements
  field :privacy, :default => "public"
  
  
  def connections
    observer_connections
  end
end