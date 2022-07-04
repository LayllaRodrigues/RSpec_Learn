# #O after hook do RSpec serve para você executar código após os seus testes. Assim
# como o before hook, ele te dá a opção de executar código depois de cada teste ou
# depois de todos os seus testes:

# after(:each) do
#  roda esse código uma vez depois de cada teste
#end
#     # ou
#     # não precisa passar o :each, pois ele é a opção default do after
#     after do
#     # roda esse código uma vez depois de cada teste
#     end
#     after(:all) do
#     # roda esse código uma vez só depois de todos os testes
#     end

# Um exemplo de onde pode ser útil o after hook é quando é necessário deletar
# arquivos gerados durante os testes.
# Imagine que você está escrevendo um teste de um objeto que salva um cache em
# um arquivo no file system:

# Ao rodar esse teste, um arquivo de cache é gerado. Para que seu teste não deixe
# sujeira para trás, você pode usar o after hook para deletar esse arquivo gerado:

after(:all) do
  FileUtils.rm(Dir.glob("#{cache_dir}/*"))
end
it "caches the result in a file" do
  expect {
    my_cool_object.run
  }.to change { File.exists?(cache_path) }.from(false).to(true)
end
