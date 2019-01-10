require "big"
require "./currency.cr"

struct Money
  def initialize(@amount : BigDecimal, @currency : Currency)
  end
end
