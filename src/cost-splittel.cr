require "./domain/payments/register.cr"

module Cost::Splittel
  VERSION = "0.1.0"
end

register = Payments::Register.create
