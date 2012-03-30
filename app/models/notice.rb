class Notice
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user
  
  field :header   ,:default => ''
  field :body     ,:default => ''
  field :notice_type, :default => "info"
  field :new, :default => true

  validates_inclusion_of :notice_type, :in => %w{info match social announcement}
  
end
