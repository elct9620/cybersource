require 'singleton'
require 'net/http'

module CyberSource
  module Client
    class Http
      include Singleton

      class << self
        def send(resource)
          return instance.post(resource) if resource.send_by_post?
          instance.get(resource)
        end
      end

      def initialize
        _uri = URI(Client.endpoint)
        @http = Net::HTTP.new(_uri.host, _uri.port)
        @http.use_ssl = true
      end

      def get(resource)
      end

      def post(resource)
        response = @http.send_request('POST', resource.full_path, resource.body, headers(token: resource.x_pay_token))
        response.body
      end

      def headers(token:)
        {
          "Content-Type" => "application/json",
          "Accept" => "application/json",
          "x-pay-token" => token
        }
      end

    end
  end
end
