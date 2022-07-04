class Game
  attr_accessor :phase
  attr_reader :output
  attr_reader :score

  def player_hits_target
    @output = "Congratulations!"
    @score = 100
  end
end

describe Game, "in the final phase" do
  before do
    @game = Game.new
    @game.phase = :final
  end
  context "when the player hits the target" do
    before { @game.player_hits_target }
    it "congratulates the player" do
      expect(@game.output).to eq("Congratuations!")
    end
    it "sets the score to 100" do
      expect(@game.score).to eq(100)
    end
  end
end

#     antes de extrair tudo que for repetido entre os seus testes para before
#     hooks, pense se ao fazer isso você não está afetando a clareza do seu teste. Ou seja,
#     não extraia tudo para before hooks só para deixar o código do seu teste “DRY”, pense
#     nas vantagens e desvantagens de fazer isso. Lembre-se que em código de teste, uma
#     das características mais importantes é a clareza e a possibilidade de entender fácil a
#     relação de causa e consequência.


