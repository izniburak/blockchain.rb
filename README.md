# blockchain.rb

a simple introduction to Blockchain algorithm.

## usage

```ruby
blockchain = Blockchain::Chain.new

blockchain.transaction(Blockchain::Transaction.new "ruby", "php", 10)
blockchain.transaction(Blockchain::Transaction.new "crystal", "ruby", 20)

new_block = blockchain.mine "new_miner_address"

puts new_block
puts new_block.transactions
puts blockchain
puts blockchain.blocks
```

## Contributing

1. Fork it (<https://github.com/izniburak/blockchain.rb/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [izniburak](https://github.com/izniburak) İzni Burak Demirtaş - creator, maintainer
