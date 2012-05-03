YentaFriend::Application.configure do  
  Pusher.app_id = '19565'
  Pusher.key = 'c9f3c4678b4cacd44725'
  Pusher.secret = '12f461c61a2692d8c307'
  
	config.after_initialize do
		ActiveMerchant::Billing::Base.mode = :test
  end

  config.cache_classes = false
  config.whiny_nils = true
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false

  config.active_support.deprecation = :log

  config.action_dispatch.best_standards_support = :builtin
  config.assets.compress = false

  config.assets.debug = true
end
