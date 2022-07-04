class Database
  def self.transaction
    puts "open transaction"
    yield
    puts "rollback transaction"
  end
end

describe "around hook" do
  around(:each) do |example|
    Database.transaction(&example)
  end
  it "runs the example as a proc" do
    puts "saving a lot of data in the database"
  end
end

# Repare que o método around passa como argumento para o seu bloco
# o example (teste criado pelo método it), o qual você pode passar
# como uma proc para um método que receba um bloco, como fizemos em
# Database.transaction(&example).