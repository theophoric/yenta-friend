YentaFriend::Application.configure do
  Pusher.app_id = '19565'
  Pusher.key = 'c9f3c4678b4cacd44725'
  Pusher.secret = '12f461c61a2692d8c307'
  
  config.cache_classes = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = false

  config.assets.compress = true

  config.assets.compile = true
  config.action_mailer.default_url_options = { :host => 'http://beta.yenta-friend.com' }  

  config.assets.digest = true
  config.action_dispatch.x_sendfile_header = nil # for heroku
  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

end
