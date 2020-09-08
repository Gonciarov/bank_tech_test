require_relative './account.rb'

class Bank

  def initialize
    @account = Account.new
  end

  def greet
    return "Welcome, Customer!"
  end


  def select
    puts 'Enter number to operate (1 - deposit, 2 - withdraw, 3 - balance and history, x - exit): '
    selection = gets.chomp
    process(selection)
  end

  def process(selection)
    case selection
      when "1"
        @account.deposit
      when "2"
        @account.withdraw
      when "3"
        @account.display_balance_history
      when "x"
        return 'come again when you ready!'
        exit
      else
        puts try_again
      end
      select
    end

    def try_again
      return "No idea what you meant, try again: "
      select
    end
end

a = Bank.new
 puts(a.greet)
 a.select
