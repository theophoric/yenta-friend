class Inbox
  include Mongoid::Document
  
  belongs_to :profile
  embeds_many :messages, :as => :messageable
  
  
end
