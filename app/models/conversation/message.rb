class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  embedded_in :conversation
  belongs_to :profile, :inverse_of => nil
  belongs_to :messageable, :polymorphic => true, :inverse_of => nil
  
  field :from_name
  field :from_icon
  field :body, :default => ""
  
end
