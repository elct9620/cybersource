require 'singleton'

module CyberSource
  class Config
    include Singleton

    attr_accessor :sandbox, :api_key, :api_secret

    class << self
      def method_missing(name, *args, &block)
        instance.send(name, *args, &block)
      end
    end

    def sandbox?
      !!@sandbox
    end

  end
end
