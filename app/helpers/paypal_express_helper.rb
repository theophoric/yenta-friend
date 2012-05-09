module PaypalExpressHelper
	def get_setup_purchase_params(request)
		return 100, {
			:ip => request.remote_ip,
			:return_url => url_for(:action => 'review', :only_path => false),
			:cancel_return_url => request.referrer,
			:subtotal => 100,
			:shipping => 0,
			:handling => 0,
			:tax =>	0,
			:allow_note =>	true,
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

 def get_order_info(gateway_response)
		{
			:shipping_address	=> gateway_response.address,
			:email=>gateway_response.email,
			:name=>gateway_response.name,
			:gateway_details=>{
				:token => gateway_response.token,
				:payer_id => gateway_response.payer_id
			},
			:subtotal=>100,
			:shipping=>0,
			:total=>100
		}
	end
end