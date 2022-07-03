class DeepThought
  def initialize(printer)
    @printer = printer
  end

  def print_the_answer
    @printer.print("42")
  end
end

RSpec.describe DeepThought do
  it "prints the answear to the ultimate question" do
    printer = double("printer")
    computer = DeepThought.new(printer)

    # programa o objeto printer para verificar se o método print
    # será chamado nesse objeto com o argumento "42" durante o
    # teste
    expect(printer).to receive(:print).with("42")

    computer.print_the_answer
  end
end
