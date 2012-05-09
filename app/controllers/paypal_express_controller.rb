class PaypalExpressController < ApplicationController
  before_filter :assigns_gateway
	skip_before_filter :authenticate_user!
  include ActiveMerchant::Billing
  include PaypalExpressHelper


# not working
  def checkout
    setup_purchase_params = get_setup_purchase_params(request)
		pp setup_purchase_params
		pp @gateway
		# bug with setup_purchase
    setup_response = @gateway.setup_purchase({})
    redirect_to @gateway.redirect_url_for(setup_response.token)
  end
	
	def authenticate_redirect
		puts "!! AuthenticateRedirect"
		current_profile.update_attributes(
			:subscription => {
				:completed => true,
				:order_info => @order_info,
				:completed_at => Time.now
			},
			:matchbook_limit => 12
		)
		current_profile.notices.create(
			:header => "Thank you for purchasing a subscription to YentaFriend",
			:body => "Your matchbook limit has been increased to 12",
			:href => matchbook_path
		)
		flash[:notice] = "Your account has been upgraded"
		redirect_to matchbook_path
	end
	
	
	def handle_response
		puts "!!! Handling response from PayPal"
		pp params
    if params[:token].nil?
      redirect_to root_url, :notice => 'Woops! Something went wrong!'
      return
    end

    gateway_response = @gateway.details_for(params[:token])
		pp gateway_response
    unless gateway_response.success?
			puts "f2"
      redirect_to root_url, :notice => "Sorry! Something went wrong with the Paypal purchase. Here's what Paypal said: #{gateway_response.message}" 
      return
    end

    @order_info = get_order_info gateway_response
		
		current_profile.update_attributes(
			:subscription => {
				:completed => gateway_response.success?,
				:order_info => @order_info,
				:completed_at => Time.now
			},
			:matchbook_limit => 12
		)
		current_profile.notices.create(
			:header => "Thank you for purchasing a subscription to YentaFriend",
			:body => "Your matchbook limit has been increased to 12",
			:href => matchbook_path
		)
		flash[:notice] = "Your account has been upgraded"
		redirect_to matchbook_path
  end
	

  private
    def assigns_gateway
      @gateway ||= PaypalExpressGateway.new(
        :login =>  "Yentafriend_api1.gmail.com",
        :password => "REK2JBW54PQKYMZ6",
        :signature =>  "AGEeG0rXbzJX3sh.zO4D6wwDmt8SAfI-P29TEhxchIaBRjEgqnaS1aaB"
      )
    end
end