class Suggestion
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :owner, :polymorphic => true
  has_and_belongs_to_many :chickstuds, :inverse_of => nil
  
end


