class Match
  include Mongoid::Document
  has_and_belongs_to_many :chickstuds
  
end
