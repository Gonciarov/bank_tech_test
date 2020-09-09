# frozen_string_literal: true

require 'date'
require_relative './statement.rb'
class Account

  attr_reader :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(sum)
    proceed(sum)
  end

  def withdraw(sum)
    proceed(-sum)
  end

  def proceed(sum)
    @balance += sum
    record(sum)
  end

  def record(sum)
    if sum.negative?
      @history.push("#{date}|| #{'%.02f' % sum.fdiv(1)} ||    || #{'%.02f' % @balance.fdiv(1)}")
    else
      @history.push("#{date}||    || #{'%.02f' % sum.fdiv(1)} || #{'%.02f' % @balance.fdiv(1)}")
    end
  end

  def display_statement
    statement = Statement.new(history)
    puts statement.display
  end

  def date
    Date.today.strftime('%d/%m/%Y')
  end
end
