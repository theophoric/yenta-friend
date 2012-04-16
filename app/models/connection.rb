class Connection
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_and_belongs_to_many :partners, :inverse_of => :partner_connection, :class_name => "Profile"
  has_and_belongs_to_many :observers, :inverse_of => :observer_connection, :class_name => "Profile"
  
  has_one :connection_suggestion
  has_many :activities
  has_one :conversation, :as => :conversable
  embeds_many :comments, :as => :commentable
  
  field :approved, :default => false
  
  field :privacy, :default => "private"
  
end

