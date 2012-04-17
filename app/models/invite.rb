class Invite
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user
  field :email
  field :name
  field :message
  field :accepted_at
  
end
