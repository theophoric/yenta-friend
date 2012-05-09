class PaypalExpressController < ApplicationController
  before_filter :assigns_gateway

  include ActiveMerchant::Billing
  include PaypalExpressHelper

  def checkout
    setup_purchase_params = get_setup_purchase_params request
    setup_response = @gateway.setup_purchase(setup_purchase_params)
    redirect_to @gateway.redirect_url_for(setup_response.token)
  end

	def review
    if params[:token].nil?
      redirect_to home_url, :notice => 'Woops! Something went wrong!' 
      return
    end

    gateway_response = @gateway.details_for(params[:token])

    unless gateway_response.success?
      redirect_to home_url, :notice => "Sorry! Something went wrong with the Paypal purchase. Here's what Paypal said: #{gateway_response.message}" 
      return
    end

    @order_info = get_order_info gateway_response, @cart
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