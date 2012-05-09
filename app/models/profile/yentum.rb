class Yentum < Profile
  
  has_many :chickstuds
  has_many :suggestions, :dependent => "destroy"
  has_many :endorsements, :dependent => "destroy"
	embeds_one :subscription

  field :privacy, :default => "public"
  field :matchbook_limit, :default => 5
  
  def connections
    observer_connections
  end

	def subscriber?
		subscription && subscription.completed
	end
end