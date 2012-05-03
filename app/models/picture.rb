class Picture
	include Mongoid::Document
	embedded_in :profile
	
	mount_uploader :source, PictureUploader
end