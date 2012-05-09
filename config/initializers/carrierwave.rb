# StringIO.class_eval { def original_filename; "stringio.txt"; end }
# 
# CarrierWave.configure do |config|
#   config.root = Rails.root.join('tmp')
#   config.cache_dir = 'carrierwave'
#   config.storage = :fog
# 	config.fog_credentials = {
# 		:provider => "AWS",
# 		:aws_access_key_id => 'AKIAICZOJNDMXYASZLUA',
# 		:aws_secret_access_key => 'aTMlJ79DVuv7JxWWwULFE7y7b3tLe0xvyUZMy7nj/2VMKEi0ohS8boyqdEM',
# 	}
# 	
# 	if Rails.env.development?
#   	config.fog_directory = 'yentafriend-development'
# 	elsif Rails.env.production?
# 		config.fog_directory = 'yentafriend-production'
# 	end
#   
# end
