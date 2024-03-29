class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  embedded_in :conversation
  belongs_to :profile, :inverse_of => nil
  belongs_to :messageable, :polymorphic => true, :inverse_of => nil
  
  default_scope desc(:created_at)
  
  field :from
  field :icon_url
  field :body, :default => ""
  field :content_type, :default => "text"
  
end
