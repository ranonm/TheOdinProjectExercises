def stock_picker(prices)
  max_profit = 0
  buying_day = 0
  while buying_day < (prices.count - 1)
    selling_day = buying_day + 1

    while selling_day < prices.count
      profit = prices[selling_day] - prices[buying_day]

      if profit > max_profit
        best_buying_day = buying_day
        best_selling_day = selling_day
        max_profit = profit
      end
            
      selling_day += 1
    end

    buying_day += 1
  end
    
  [best_buying_day, best_selling_day]
end

p stock_picker([17,3,6,9,15,8,6,1,10])