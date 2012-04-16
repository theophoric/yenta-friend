class Inbox
  include Mongoid::Document
  
  belongs_to :profile
  has_many :conversations, :as => :conversable
  
end
