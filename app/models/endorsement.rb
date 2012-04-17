class Endorsement
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :yentum
  belongs_to :chickstud
  
  default_scope where(:is_active => true)
  
  field :primary, :default => false
  field :is_active, :default => true
  field :message
  
  def active?
    
  end
  
  class << self
    def active
      where(:is_active => true)
    end
    
  end
  
  
  
end
