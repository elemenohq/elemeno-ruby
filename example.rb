require "elemeno"

# elemeno = Elemeno::Client.new('598cba62-28c4-11e6-9eca-e7db6722f18d')
elemeno = Elemeno::Client.new('1fe839a4-2288-11e6-a2f1-1b01b4863694')

# elemeno.hello

collections = elemeno.getCollection('books')

puts 'COLLECTIONS ARE LIFE'
puts collections['data']


