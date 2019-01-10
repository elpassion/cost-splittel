require "./services/payments"

module Cost::Splittel
  VERSION = "0.1.0"
end

Services::Payments.new(PaymentsRegisterRepository.new).add_participant(UUID.random, UUID.random)

