# frozen_string_literal: true

class Statement
  def initialize(history)
    @history = history
  end

  def statement_header
    return 'date  || credit || debit || balance'
  end

  def display
    return "#{statement_header}\n #{@history.reverse.join("\n")}"
  end
end
