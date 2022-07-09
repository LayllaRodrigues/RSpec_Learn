# O let serve para definir um helper method (método auxiliar) para o seu teste.
# Vamos começar a entender o let analisando o seguinte exemplo:

describe Game do
  let(:ui) { TwitterUi.new("sandbox_username", "sandbox_password") }
end

# O código acima cria um método chamado ui que quando chamado irá retornar
# um objeto da classe TwitterUi. Esse método pode ser usado dentro de um teste,
# como a seguir:

describe Game do
  before do
    @game = Game.new
  end

  let(:ui) { TwitterUi.new("sandbox_username", "sandbox") }

  it "congratulates the player when the player hits the target" do
    @game.ui = ui # chamando o método definido pelo let
    @game.player_hits_target
    expect(@game.output).to include("Congratulations!")
  end
end

# Uma outra característica interessante do let é que sua execução é lazy. Ou seja,
#     o bloco de código passado para ele só vai ser executado se você chamar o método
#     definido pelo let. Esse comportamento é diferente do comportamento do before
#     hook, que sempre executa seu bloco de código para todos os examples do seu escopo.
#     Para esclarecer esse comportamento, segue um exemplo:

describe "The lazy-evaluated behavior of let" do
  before { @foo = "bar" }

  let(:broken_operation) { raise "I'm broken" }

  it "will call the method defined by let" do
    expect {
      expect(@foo).to eq("bar")
      broken_operation
    }.to raise_error("I'm broken")
  end

  it "won't call the method defined by let" do
    expect {
      expect(@foo).to eq("bar")
    }.not_to raise_error
  end
end


