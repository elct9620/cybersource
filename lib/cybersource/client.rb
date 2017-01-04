require 'cybersource/client/http'

module CyberSource
  module Client
    PRODUCTION_ENDPOINT = "https://api.visa.com/cybersource"
    SANDBOX_ENDPOINT = "https://sandbox.api.visa.com/cybersource"

    def self.endpoint
      Config.sandbox? ? SANDBOX_ENDPOINT : PRODUCTION_ENDPOINT
    end
  end
end
