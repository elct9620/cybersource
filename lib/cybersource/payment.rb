require 'json'

module CyberSource
  class Payment < Hash
    CARD_TYPES = {
      "Visa"                  => "001",
      "MasterCard"            => "002",
      "American Express"      => "003",
      "Discover"              => "004",
      "Diners Club"           => "005",
      "Carte Blanche"         => "006",
      "JCB"                   => "007",
      "EnRoute"               => "014",
      "JAL"                   => "021",
      "Maestro UK Domestic"   => "024",
      "Delta"                 => "031",
      "Visa Electron"         => "033",
      "Dankort"               => "034",
      "Carte Bleue"           => "036",
      "Carta Si"              => "037",
      "Maestro International" => "042",
      "GE Money UK Card"      => "043",
      "Hipercard"             => "050", # (sale only)
      "Elo"                   => "054"
    }

    def initialize(
      card_number: "",
      card_expiration_month: "",
      card_expiration_year: "",
      card_type: nil,
      card_verification_indicat: "",
      cvn: "",
      encrypted_data: "",
      encrypted_descriptor: "",
      encrypted_encoding: "",
      encrypted_key: "",
      cavv: "",
      xid: "",
      ucaf_authentication_data: "",
      ucaf_collection_indifator: "",
      network_token_transaction_type: "",
      network_token_requestor_id: "",
      &block
    )
      self[:cardNumber] = card_number
      self[:cardExpirationMonth] = card_expiration_month
      self[:cardExpirationYear] = card_expiration_year
      self[:cardType] = CARD_TYPES[card_type.to_s] || card_type

      # TODO: Above attributes should implement helper method
      self[:card_verification_indicat] = card_verification_indicat

      self[:cvn] = cvn

      self[:encrypted_data] = encrypted_data
      self[:encrypted_descriptor] = encrypted_descriptor
      self[:encrypted_encoding] = encrypted_encoding
      self[:encrypted_key] = encrypted_key

      self[:cavv] = cavv
      self[:xid] = xid

      self[:ucaf_authentication_data] = ucaf_authentication_data
      self[:ucaf_collection_indifator] = ucaf_collection_indifator

      self[:network_token_transaction_type] = network_token_transaction_type
      self[:network_token_requestor_id] = network_token_requestor_id

      instance_eval(&block) if block_given?
    end

    def card(number:, expiration_month:, expiration_year:, type: nil)
      self[:cardNumber] = number
      self[:cardExpirationMonth] = expiration_month
      self[:cardExpirationYear] = expiration_year
      self[:cardType] = CARD_TYPES[type.to_s] || type
    end

  end
end
