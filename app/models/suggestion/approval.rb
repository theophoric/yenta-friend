class Approval
  include Mongoid::Document
  
  belongs_to :profile
  embedded_in :approvable, :polymorphic => true
  
  scope :pending, where(:approved_at => nil)
  
  field :approved_at, :type => DateTime
  field :approved_message
  
end