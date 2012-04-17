class Inbox
  include Mongoid::Document
  
  belongs_to :profile
  embeds_many :message_references
  
end
