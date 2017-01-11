require 'json'
require 'digest'
require 'openssl'

module CyberSource
  module Request
    class Resource < Hash
      def initialize(path, send_by_post = false)
        @path = path
        @send_by_post = send_by_post
      end

      def send_by_post?
        !!@send_by_post
      end

      def path
        "#{CyberSource::Client::BASE_URI}/#{resource_path}"
      end

      def resource_path
        "payments/#{CyberSource::Client::VERSION}/#{@path}"
      end

      def full_path
        "#{path}?#{query}"
      end

      def query
        URI.encode_www_form(apikey: Config.api_key)
      end

      def body
        to_json
      end

      def x_pay_token
        timestamp = Time.now.utc.to_i
        hash_input = "#{timestamp}#{resource_path}#{query}#{body}"
        hash_output = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), Config.api_secret, hash_input)
        "xv2:#{timestamp}:#{hash_output}"
      end
    end
  end
end
