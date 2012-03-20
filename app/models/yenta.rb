class Yenta < User
  include Mongoid::Document
  has_many :chickstuds
  
  
end
