class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :conversable, :polymorphic => true
  has_and_belongs_to_many :inboxes
  has_and_belongs_to_many :participants, :class_name => "Profile"
  embeds_many :messages
  
end
