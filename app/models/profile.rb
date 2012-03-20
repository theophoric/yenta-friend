class Profile
  include Mongoid::Document
  
  belongs_to :profilable, :polymorphic => true
  
  field :name_first
  field :name_last
  field :age, :default => 18
  field :occupation
  field :description

  
end

