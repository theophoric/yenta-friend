class Endorsement
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :yentum
  belongs_to :chickstud
  
  field :primary, :default => false
  field :active, :default => true
  field :message
  
end
