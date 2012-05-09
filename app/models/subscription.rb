class Subscription
  include Mongoid::Document
	include Mongoid::Timestamps

	embedded_in :yentum
	
	field :completed, :default => false
	field :completed_at
	field :order_info
	
end
