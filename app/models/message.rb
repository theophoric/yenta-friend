class Message
  include Mongoid::Document
  
  embedded_in :messageable, :polymorphic => true
  
  field :from_name
  field :from_icon
  field :body, :default => ""
  
end
