require_relative 'calculator'

class CLI
  attr_reader :calculator

  def initialize
    @calculator = Calculator.new
  end

  def run
    print_cursor
    handle_input(gets.chomp.strip)
    run
  rescue Calculator::UnrecognizedInputError
    puts "Unrecognized input '#{input}'"
    run
  rescue StandardError
    puts 'Exiting'
    exit
  end

  private

  def handle_input(input)
    if input == 'clear'
      system('clear')
    else
      output = calculator.handle_input(input)

      output.each do |part|
        puts part
      end
    end
  end

  def print_cursor
    print "> "
  end
end
