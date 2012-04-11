class Activity
  include Mongoid::Document
  
  belongs_to :connection
  has_one :activity_suggestion
  embeds_many :comments, :as => :commentable
  
  field :activity
  field :location
  field :time
  
end
