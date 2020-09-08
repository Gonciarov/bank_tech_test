require 'date'

class Account
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

  def thanks
    return "Thank you!"
  end

  def display_balance
    return "Your current balance is #{@balance}"
  end

  def record(sum)
    if sum < 0
      @history.push("#{Date.today.strftime("%e %b %Y")}|| #{sum} ||    || #{@balance}")
    else
      @history.push("#{Date.today.strftime("%e %b %Y")}||    || #{sum} || #{@balance}")
    end
  end

  def display_history_header
    return "   date  || credit || debit || balance"
  end

  def display_balance_history
    puts display_balance
    puts display_history_header
    @history.reverse.each { |record| puts record }
  end
end
