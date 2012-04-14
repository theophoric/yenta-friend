class Conversation
  include Mongoid::Document
  belongs_to :conversable, :polymorphic => true
  has_and_belongs_to_many :profiles
  embeds_many :messages
end
