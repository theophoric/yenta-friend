# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::MiniMagick

  def store_dir
		"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

	process :resize_to_limit => [940, 940]
	
	version :thumb do
		process :resize_to_fill => [80,80]
	end
	
	version :small_square do
		process :resize_to_fill => [230,230]
	end
	
	# version :small do
	# 	process :resize_to_limit => [230, 230]
	# end
	
	version :medium_square do
		process :resize_to_fill => [570, 570]
	end
	
	# version :medium do
	# 	process :resize_to_limit => [570, 570]
	# end
	
	version :large_square do
		process :resize_to_fill => [970,970]
	end
	
	version :large do
		process :resize_to_limit => [970,970]
	end
		

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
