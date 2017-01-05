require "cybersource/version"
require "cybersource/client"
require "cybersource/config"
require "cybersource/payment"

module CyberSource
  def self.configure(&block)
    _config = Config.instance
    _config.instance_exec(_config, &block) if block_given?
    _config
  end
end
