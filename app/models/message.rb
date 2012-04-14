class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  embedded_in :conversation, :polymorphic => true
  belongs_to :profile
  
  field :from_name
  field :from_icon
  field :body, :default => ""
  
end
