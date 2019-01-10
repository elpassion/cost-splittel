require "../../common/money.cr"

module Payments
  class Cost
    def initialize(@amount : Money, @payer_id : ParticipantId)
    end
  end
end
