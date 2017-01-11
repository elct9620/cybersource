module CyberSource
  module Request
    class Capture < Resource
      def initialize(id:,
                    amount: 0,
                    currency: "USD",
                    purchasing_level: "3",
                    reference_id: nil,
                    vc_order_id: nil,
                    bill_to: nil,
                    ship_to: nil,
                    order: nil,
                    business: nil,
                    emv: nil,
                    payment_solution: nil,
                    merchant_defined_data: nil,
                    items: nil,
                    merchant_descriptor: nil,
                    &block)

        super "authorizations/#{id}/captures", true

        self[:amount] = amount.to_s
        self[:currency] = currency
        self[:purchasingLevel] = purchasing_level unless purchasing_level.nil?

        self[:referenceId] = reference_id unless reference_id.nil?
        self[:vcOrderId] = vc_order_id unless vc_order_id.nil?

        self[:billTo] = bill_to unless bill_to.nil?
        self[:shipTo] = ship_to unless ship_to.nil?

        self[:order] = order unless order.nil?
        self[:business] = business unless business.nil?
        self[:emv] = emv unless emv.nil?
        self[:paymentSolution] = payment_solution unless payment_solution.nil?
        self[:merchantDefinedData] = merchant_defined_data unless merchant_defined_data.nil?
        self[:items] = items unless items.nil?
        self[:merchantDescriptor] = merchant_descriptor unless merchant_descriptor.nil?

        instance_eval(&block)
      end

      def amount(_amount)
        self[:amount] = _amount.to_s
      end

      def currency(_currency)
        self[:currency] = _currency
      end
    end
  end
end
