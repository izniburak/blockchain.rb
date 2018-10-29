require_relative "lib/blockchain"

blockchain = Blockchain::Chain.new

blockchain.transaction(Blockchain::Transaction.new "ruby", "php", 10)
blockchain.transaction(Blockchain::Transaction.new "crystal", "ruby", 20)

block = blockchain.mine "miner_address"

blockchain.transaction(Blockchain::Transaction.new "php", "java", 10)
blockchain.transaction(Blockchain::Transaction.new "ruby", "crystal", 50)
blockchain.transaction(Blockchain::Transaction.new "java", "dotnet", 30)

block = blockchain.mine "miner_address"

blockchain.blocks.map.with_index do |block, i|
  puts "##{i} Block Hash: #{block.hash}"
  block.transactions.map do |t|
    puts t.info
  end
end
