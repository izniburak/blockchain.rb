module Blockchain
  class Transaction
    def initialize(from = nil, to, amount)
      @from = from
      @to = to
      @amount = amount
    end

    def info
      {"from" => @from, "to" => @to, "amount" => @amount}
    end
  end
end
