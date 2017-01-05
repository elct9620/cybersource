module CyberSource
  module Request
    class AuthorizeCreditCard < Resource
      def initialize(amount: 0,
                     currency: "USD",
                     payment: CyberSource::Payment.new,
                     bill_to: nil,
                     ship_to: nil,
                     emv: nil,
                     pos: nil,
                     business: nil,
                     purchase_total: nil,
                     payment_details: nil,
                     vc_order_id: nil,
                     commerce_indicator: nil,
                     ignore_avs: nil,
                     ignore_bad_cvn: nil,
                     reference_id: nil,
                     payment_solution: nil,
                     merchant_defined_data: nil,
                     items: nil,
                     merchant_descriptor: nil,
                     payer_auth: nil,
                     &block
                    )

        super "authorizations", true

        self[:amount] = amount
        self[:currency] = currency
        self[:payment] = payment

        # TODO: Below method needs to create helper method
        self[:billTo] = bill_to if bill_to
        self[:shipTo] = ship_to if ship_to

        self[:emv] = emv if emv
        self[:pos] = pos if pos

        self[:business] = business if business

        self[:purchaseTotal] = purchase_total if purchase_total
        self[:paymentDetails] = payment_details if payment_details

        self[:vcOrderId] = vc_order_id if vc_order_id
        self[:commerceIndicator] = commerce_indicator if commerce_indicator

        self[:ignoreAvs] = ignore_avs if ignore_avs
        self[:ignoreBadCvn] = ignore_bad_cvn if ignore_bad_cvn

        self[:referenceId] = reference_id if reference_id
        self[:paymentSolution] = payment_solution if payment_solution
        self[:merchantDefinedData] = merchant_defined_data if merchant_defined_data
        self[:items] = items if items
        self[:merchantDescriptor] = merchant_descriptor if merchant_descriptor
        self[:payerAuth] = payer_auth if payer_auth

        instance_eval(&block) if block_given?
      end

      def amount(_amount)
        self[:amount] = _amount
      end

      def currency(_currency)
        self[:currency] = _currency
      end

      def payment(_params = nil, &block)
        self[:payment] = CyberSource::Payment.new(**_params) unless _params.nil?
        self[:payment].instance_eval(&block) if block_given?
      end
    end
  end
end
