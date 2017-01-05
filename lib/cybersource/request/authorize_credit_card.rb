module CyberSource
  module Request
    class AuthorizeCreditCard < Resource
      def initialize(amount:,
                     currency:,
                     payment:,
                     billTo: {},
                     shipTo: {},
                     emv: {},
                     pos: {},
                     business: {},
                     purchaseTotal: {},
                     paymentDetails: {},
                     vcOrderId: nil,
                     commerceIndicator: nil,
                     ignoreAvs: nil,
                     ignoreBadCvn: nil,
                     referenceId: nil,
                     merchantDefinedData: {},
                     items: {},
                     merchantDescriptor: {},
                     payerAuth: {}
                    )

        super "authorizations", true

        self[:amount] = amount
        self[:currency] = currency
        self[:payment] = payment
      end
    end
  end
end
