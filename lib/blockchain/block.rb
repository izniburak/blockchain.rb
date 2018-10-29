require "digest"
require_relative "./consts"

module Blockchain
  class Block
    def initialize(timestamp, transactions, prev_hash = nil)
      @timestamp = timestamp
      @transactions = transactions
      @prev_hash = prev_hash
      @hash = ""
      @nonce = 0
    end

    def new_hash
      data = {
        "timestamp" => @timestamp,
        "transactions" => @transactions,
        "nonce" => @nonce,
        "prev_hash" => @prev_hash
      }.to_s
      hash = Digest::SHA256.new
      hash.update(data)
      hash.hexdigest
    end

    def mine
      until verify
        @nonce += 1
        @hash = new_hash        
      end
    end

    def verify
      prefix = "0" * DIFFICULTY
      @hash.start_with?(prefix)
    end

    def validate(prev)
      @hash === new_hash && @prev_hash === prev.hash
    end

    def hash 
      @hash
    end

    def prev_hash
      @prev_hash
    end

    def transactions
      @transactions
    end
  end
end
