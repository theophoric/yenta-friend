class PaypalExpressController < ApplicationController
  before_filter :assigns_gateway

  include ActiveMerchant::Billing
  include PaypalExpressHelper

  def checkout
    total_as_cents, setup_purchase_params = get_setup_purchase_params @cart, request
    setup_response = @gateway.setup_purchase(100, setup_purchase_params)
    redirect_to @gateway.redirect_url_for(setup_response.token)
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