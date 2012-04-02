class Match
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_and_belongs_to_many :chickstuds
  embeds_many :matches
  
end

class ChickstudReference
  include Mongoid::Document
  embedded_in :match
  
end