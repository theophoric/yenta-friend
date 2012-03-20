class Chickstud < User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user
  has_one :profile, :as => :profilable
  has_and_belongs_to_many :users
  
end
