class Approval
  include Mongoid::Document
  
  belongs_to :profile
  embedded_in :approvable, :polymorphic => true
  
  field :approved_at, :type => DateTime
  field :approved_message
  
end