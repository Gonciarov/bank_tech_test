require 'date'
require_relative './statement.rb'
class Account

  attr_reader :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit
    puts "Amount of your deposit: "
    sum = gets.chomp.to_i
    proceed(sum)
  end

  def withdraw
    puts "Amount of your withdrawal: "
    sum = gets.chomp.to_i * (-1)
    proceed(sum)
  end

  def proceed(sum)
    @balance += sum
    puts thanks
    puts display_balance
    record(sum)
  end

  def display_balance
    return "Your current balance is #{@balance}"
  end

  def thanks
    return "Thank you!"
  end

  def record(sum)
    if sum < 0
      @history.push("#{Date.today.strftime('%d/%m/%Y')}|| #{sum} ||    || #{@balance}")
    else
      @history.push("#{Date.today.strftime('%d/%m/%Y')}||    || #{sum} || #{@balance}")
    end
  end

  def display_statement
    statement = Statement.new(history)
    statement.display
  end
end
