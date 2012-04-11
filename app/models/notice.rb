class Notice
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user
  default_scope desc(:created_at)
  
  field :header   ,:default => ''
  field :body     ,:default => ''
  field :notice_type, :default => "info"
  field :new, :default => true
  field :icon_url
  field :href, :default => '#'
  validates_inclusion_of :notice_type, :in => %w{info match social announcement}
  
end
