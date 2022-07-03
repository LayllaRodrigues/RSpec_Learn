Sobre o repositório:
Este repositório contém varios exemplos direcionados a pratica de Test Driven Development na linguagem Ruby, utilizando RSpec para testes unitários, com seus Matchers e funções descritos em detalhes.

Objetivo:
Sumarizar todos os tipos de Matchers relacionados tanto aos objetos primários em Ruby (Enumerators, Classes), quanto os Matchers especificos (Erros de Execução e Matchers Customizados)

Rspec Matchers:
Um matcher no RSpec é um objeto que verifica o comportamento esperado nos testes unitários P/ iniciar o boiler de testes unitários, basta inserir no terminal o comando rspec --init

expect(actual).to matcher(expected)
expect(actual).to_not matcher(expected)
Matchers relacionados a truthy e falsy (Booleans)
São matchers que testam se um objeto retorna como true ou false.

# passa se obj é truthy (diferente de nil e false)
expect(obj).to be_truthy
# passa se obj é falsy (nil ou false)
expect(obj).to be_falsey
# passa se obj é nil
expect(obj).to be_nil
# passa se obj é truthy (não nil e não false)
expect(obj).to be
Matchers de equidade
Compara se dois objetos são iguais, utilizando comparação genérica (==)

a = "some string"
b = "some string"
a == b # true
expect(a).to eq(b)    # passa pois a == b

expect(a).to equal(b) # passa quando a e b são referências
                      # para o mesmo objeto (a.equal?(b))

expect(a).to be(b)    # equivalente a `expect(a).to equal(b)`
expect(a).to eql(b)   # passa quando a e b possuem
                      # o mesmo hash code (a.eql?(b))
Matchers relacionados a arrays
Verifica se um array é "igual" ao outro, independente da ordem dos seus elementos

# MatchArray
array = [1, 2, 3, 4]

expect(array).to match_array([1, 2, 3, 4])
expect(array).to match_array([4, 3, 2, 1])

expect(array).not_to match_array([1, 2, 3])
expect(array).not_to match_array([1, 2, 3, 4, 5])”


# MatchInclude
array = [1, 2, 3, 4]

expect(array).to include(1)
expect(array).to include(1, 2, 3)
expect(array).to include(1, 2, 3, 4)

expect(array).not_to include(0)
expect(array).not_to include(5)
expect(array).not_to include(5, 6, 7, 8)
expect(array).not_to include([1, 2, 3, 4])

# end_with (Tail)
array = [1, 2, 3, 4]

expect(array).to end_with(4)
expect(array).to end_with(3, 4)
expect(array).not_to end_with(3)

# start_with (Head)
expect(array).to start_with(1)
expect(array).to start_with(1, 2)
expect(array).not_to start_with(2)


Matchers relacionados a Hashes
# MatchInclude
hash = { a: 7, b: 5 }

# Verificar se um hash tem uma ou mais chaves
expect(hash).to include(:a)
expect(hash).to include(:a, :b)

# Verificar se um hash tem um ou mais pares
# de chave - valor
expect(hash).to include(a: 7)
expect(hash).to include(b: 5, a: 7)

expect(hash).not_to include(:c)
expect(hash).not_to include(a: 11)
expect(hash).not_to include(a: 13, c: 11)
expect(hash).not_to include(:c, :d)

Matchers relacionados a Strings
Verifica o valor de uma string atráves de uma regex

# Matcher Match
string = "gabriel schiavo"

expect(string).to match(/gabriel/)
expect(string).to match(/chiav/)

expect(string).not_to match(/silva/)
expect(string).not_to match(/rafael/)” 

# Include Matcher
expect(string).to include("g")
expect(string).to include("gabriel")
expect(string).to include("gab", "sch")

expect(string).not_to include("silva")
expect(string).not_to include("gabs")”

# start_with (Head) 
expect(string).to start_with("gabriel")
expect(string).not_to start_with("schiavo")

# end_with (Tail)
expect(string).to end_with("schiavo")
expect(string).not_to end_with("gabriel")

Predicate Matchers
São matchers dinâmicos que invocam métodos atráves da metaprogramação


hash = { key: 1 }
# chama o método hash.has_key?(:key)
expect(hash).to have_key(:key)

# Predicates in some objects
RSpec.describe Cart do
  describe "#has_products?" do
    it "returns true if it has products" do
      product = Product.new
      cart = Cart.new(product)
      # chama o método cart.has_products?
      expect(cart).to have_products
    end
  end
end

# be_a_method_name / be_an_method_name
expect(cart).to be_a_thing    # chama o método cart.thing?
expect(cart).to be_an_object  # chama o método cart.object?
Exceptions Matchers
RaiseError Matcher é um método de um Matcher que levanta uma determinada exception


expect { raise }.to raise_error
expect { raise }.to raise_exception

# correto
expect { raise }.to raise_error

# correto
expect do
  raise
end.to raise_error

# errado
expect(raise).to raise_error 

# TODOS ACIMA SÃO VALIDOS, PORÉM GERAM FALSOS POSITIVOS

# Verifica a exception levantada é de uma classe específicaß
expect { raise RuntimeError }.to raise_error(RuntimeError)
expect { raise StandardError }.to_not raise_error(ArgumentError)

# Verifica a mensagem da exception levantada
expect { raise "error" }.to raise_error("error")
expect { raise "error" }.to_not raise_error("other error")

Matchers para comparação de números (Int)

pi_number = 3.14
expect(pi_number).to eq(3.14)

expect(7).to be < 10
expect(7).to be > 1
expect(7).to be <= 7
expect(7).to be >= 7

Matchers de Floats
Normalmente utilizamos matchers que aproximam as casas decimais dos números fracionados


expect(Math::PI).to be_within(0.01).of(3.14)

# Intervalo válido entre delta e o número esperado
expect(actual).to be_within(delta).of(expected)

Matchers p/ Ranges
range = (1..10)

expect(range).to cover(1)
expect(range).to cover(10)
expect(range).to cover(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
expect(range).to cover(5, 6, 7, 8)

Matchers de Classe
Verifica qual a classe o objeto é


# be_an_instance_of verifica se o objeto é uma instância da
# classe dada

expect(5).to be_an_instance_of(Integer)

expect(5).not_to be_an_instance_of(Numeric)
expect(5).not_to be_an_instance_of(String)
# be_a_kind_of verifica se o objeto é uma instância da classe
# dada ou de uma subclasse da classe dada

expect(5).to be_a_kind_of(Integer)
expect(5).to be_a_kind_of(Numeric)
expect(5).to be_a_kind_of(Object)

expect(5).not_to be_a_kind_of(String)

Matchers de mudanças de estado ou valor
Usamos o ChangeMatcher quando queremos verificar que a execução de um bloco de código, cause uma mudança de estado em um objeto especifíco


RSpec.describe StateMachine do
  describe "#start" do
    it "Changes State Machine from :initial to :started" do
    end
  end
end

# Verifica que ao rodar Counter.increment o valor de
# Counter.count é modificado em duas unidades
expect {
  Counter.increment
}.to change { Counter.count }.by(2)

# Verifica que ao tentar salvar um user com um atributo inválido
# o valor de User.count não é modificado
expect {
  invalid_attributes = { name: nil }
  user = User.new(invalid_attributes)
  user.save
}.to_not change(User, :count)

# Verifica que ao adicionar alguns jogadores ao objeto team,
# o valor de team.size é modificado por pelo menos uma unidade
expect {
  team.add_players(some_players)
}.to change(team, :size).by_at_least(1)

