class Activity
  include Mongoid::Document
  
  belongs_to :connection
  
  embeds_many :comments, :as => :commentable
  
  field :activity
  field :location
  field :time
  
end
