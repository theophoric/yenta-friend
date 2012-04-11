class Connection
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_and_belongs_to_many :chickstuds
  has_and_belongs_to_many :yenta
  
  has_many :activities, :as => :suggestable
  embeds_many :messages, :as => :messageable
  embeds_many :comments, :as => :commentable
  
  field :privacy
  
end

