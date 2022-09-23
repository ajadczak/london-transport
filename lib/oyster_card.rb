class OysterCard
  attr_reader :value, :transactions

  def initialize
    @value = 0
    @transactions = []
  end

  def credit(amount)
    @value += amount
    @transactions.push(amount)
  end

  def debit(amount)
    @value -= amount
    @transactions.push(-amount)
  end

  def void_last_charge
    amount = @transactions.pop
    @value -= amount
  end

  def balance
    @value.to_f / 100
  end

  def transaction_history
    @transactions
  end
end
