# frozen_string_literal: true

require 'date'
require_relative './statement.rb'
class Account

  attr_reader :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit
    puts 'Amount of your deposit: '
    sum = gets.chomp.to_i
    proceed(sum)
  end

  def withdraw
    puts 'Amount of your withdrawal: '
    sum = gets.chomp.to_i * -1
    proceed(sum)
  end

  def proceed(sum)
    @balance += sum
    puts thanks
    puts display_balance
    record(sum)
  end

  def display_balance
    "Your current balance is #{'%.02f' % @balance.fdiv(1)}"
  end

  def thanks
    'Thank you!'
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
    statement.display
  end

  def date
    Date.today.strftime('%d/%m/%Y')
  end
end
