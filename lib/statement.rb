# frozen_string_literal: true

class Statement
  def initialize(history)
    @history = history
  end

  def statement_header
    '   date  || credit || debit || balance'
  end

  def display
    puts statement_header
    @history.reverse.each { |record| puts record }
  end
end
