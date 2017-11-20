class Calculator
  UnrecognizedInputError = Class.new(StandardError)

  MATCHERS = {
    integer:  /^-?\d+$/,
    float:    /^-?[0-9]+(\.[0-9]+)?$/,
    operator: /^[-+\/*]$/
  }.freeze

  attr_reader :stack

  def initialize
    @stack = []
  end

  def handle_input(input)
    [].tap do |output|
      input.split(' ').each do |part|
        handle_part(part)
      end
    end
  end

  private

  def handle_part(part)
    case part
    when MATCHERS[:integer]
      @stack.push(part.to_i)
    when MATCHERS[:float]
      @stack.push(part.to_f)
    when MATCHERS[:operator]
      output.push(operate(part))
    when /^state$/ # state command, just inspect the stack
      output.push(@stack.inspect)
    else
      raise UnrecognizedInputError.new
    end
  end

  def operate(operator)
    result = @stack.reduce(operator.to_sym)
    @stack = []
    result
  end
end
