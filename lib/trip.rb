class Trip
  attr_reader :from, :to, :is_bus

  def initialize(from, to, by_bus: false)
    @from = from
    @to = to
    @is_bus = by_bus
  end
end
