class Match
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_and_belongs_to_many :chickstuds
  embeds_many :chickstud_references
  
  after_create :build_chickstud_references
  
  def build_chickstud_references
    chickstuds.each{|cs| chickstud_references.create(cs.attributes)}
  end
  
end

class ChickstudReference
  include Mongoid::Document
  embedded_in :match
  
  field :accepted, :type => Boolean, :default => false
  
end