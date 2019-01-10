struct Currency
  PLN = Currency.new("PLN", "zł")

  def initialize(@iso_code : String, @symbol : String)
  end
end
