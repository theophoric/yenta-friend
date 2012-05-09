module PaypalExpressHelper
  def get_setup_purchase_params(request)
    return {
      :ip => request.remote_ip,
      :return_url => url_for(:action => 'review', :only_path => false),
      :cancel_return_url => request.referrer,
      :subtotal => 100,
      :shipping => 0,
      :handling => 0,
      :tax =>      0,
      :allow_note =>  true,
      :items => {
				:name => "YentaFriend Subscription", 
				:number => 1, 
				:quantity => 1, 
				:amount => 100
			}
    }
  end

  def to_cents(money)
    (money*100).round
  end
end