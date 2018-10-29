require_relative './block'
require_relative './transaction'
require_relative './consts'

module Blockchain
  class Chain
    def initialize
      @chain, @prepare_data = Array.new, Array.new
      @reward = REWARD
      boot
    end

    def boot
      @chain << Block.new(Time.now, Array.new)
    end

    def transaction(data)
      @prepare_data << data
    end

    def mine(miner)
      block = Block.new(Time.now, @prepare_data, @chain.last.hash)
      block.mine 

      @chain.push block
      @prepare_data = Array.new
      @prepare_data << Transaction.new(nil, miner, @reward.to_f)

      block
    end

    def validate
      @chain.map.with_index do |data, i|
        return false unless @data.validate @chain[i-1]
      end
      true
    end

    def blocks
      @chain
    end
  end
end
