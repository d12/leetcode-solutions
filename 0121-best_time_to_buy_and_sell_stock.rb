# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  max_profit_so_far = 0
  current_buy = prices[0]

  prices[1..-1].each do |price|
    if price < current_buy
      current_buy = price
    else
      max_profit_so_far = [max_profit_so_far, price - current_buy].max
    end
  end

  max_profit_so_far
end