class Suggestion
  include Mongoid::Document
  
  embedded_in :suggestable, :polymorphic => true
  
  field :activity
  field :location
  field :time
  
  
  
end
