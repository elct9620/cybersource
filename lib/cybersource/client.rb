require 'cybersource/client/http'
require 'cybersource/request'

module CyberSource
  module Client

    PRODUCTION_URL = "https://api.visa.com"
    SANDBOX_URL = "https://sandbox.api.visa.com"

    BASE_URI = "/cybersource"
    VERSION = "v1"

    include Request

    module_function
    def endpoint
      Config.sandbox? ? SANDBOX_URL : PRODUCTION_URL
    end

    # CyberSource API
    def authorize_credit_card(params = {}, &block)
      _body = AuthorizeCreditCard.new(**params, &block)
      Http.send _body
    end

    def capture(params = {}, &block)
      _body = Capture.new(**params, &block)
      Http.send _body
    end
  end
end
