require 'singleton'
require 'net/http'

module CyberSource
  module Client
    class Http
      include Singleton

      class << self
        def send(object)
        end
      end

      def initialize
        _uri = URI(Client.endpoint)
        @http = Net::HTTP.new(_uri.host, _uri.port, use_ssl: true)
      end

    end
  end
end
