require_relative 'calculator'

class CLI
  attr_reader :calculator

  def initialize
    @calculator = Calculator.new
  end

  def prompt
    print_cursor
    input = gets.chomp.strip
    handle_input(input)
    prompt
  rescue Calculator::UnrecognizedInputError
    puts "Unrecognized input '#{input}'"
    prompt
  rescue StandardError
    print_exit
  end

  private

  def handle_input(input)
    if input == 'clear'
      system('clear')
    elsif input == 'q'
      print_exit
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

  def print_exit
    puts "Exiting\n"
    exit
  end
end
