class Connection
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_and_belongs_to_many :chickstuds
  
  embeds_many :suggestions, :as => :suggestable
  embeds_many :messages, :as => :messageable
  
  field :privacy
  
end

