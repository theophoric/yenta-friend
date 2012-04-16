class Conversation
  include Mongoid::Document
  
  has_and_belongs_to_many :participants, :class_name => "Profile"
  embeds_many :messages
  
end
