class Approval
  include Mongoid::Document
  
  belongs_to :chickstud
  embedded_in :suggestion
  
  field :approved_at, :type => DateTime
  field :approved_message
  
end