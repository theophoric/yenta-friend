class ProfilePreview
  include Mongoid::Document
  
  embedded_in :profile
  
  field :name
  field :first_name
  field :last_name
  field :image_url
  field :gender
  
  def update_fields
    update_attributes(profile.attributes.extract!("name", "first_name","last_name","gender"))
  end
  
end