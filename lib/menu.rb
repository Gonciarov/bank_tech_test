# frozen_string_literal: true

require_relative './account.rb'

class Menu
  def initialize
    @account = Account.new
  end

  def greet
    'Welcome, Customer!'
  end

  def show_options
    'Enter number to operate (1 - deposit, 2 - withdraw, 3 - balance and history, x - exit): '
  end

  def select
    puts show_options
    selection = gets.chomp
    process(selection)
  end

  def process(selection)
    case selection
    when '1'
      @account.deposit
    when '2'
      @account.withdraw
    when '3'
      @account.display_statement
    when 'x'
      return 'come again when you ready!'
    else
      puts try_again
      end
    select
    end

  def try_again
    return 'No idea what you meant, try again: '
    select
  end
end

a = Menu.new
puts(a.greet)

a.select
