class MessageReference
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :conversation, :inverse_of => nil
  belongs_to :profile, :inverse_of => nil
  belongs_to :messageable, :polymorphic => true, :inverse_of => nil
    
  default_scope desc(:created_at)
  
  field :from_name
  field :from_icon
  field :body, :default => ""
  field :content_type, :default => "text"
  
end