class Statement

  def initialize(history)
    @history = history
  end

  def statement_header
    return "   date  || credit || debit || balance"
  end

  def display
    puts statement_header
    @history.reverse.each { |record| puts record }
  end
end
