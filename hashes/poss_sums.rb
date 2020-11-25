def possibleSums(coins, quantity)
  sums = Hash.new(0)
  sums[0] = 1
  coins.each_with_index do |coin, index|
    sums.keys.each do |key|
      quantity[index].times do |i|
        sums[key+coin*(1+i)] += 1
      end
    end
  end
  print sums.keys.size - 1
end

coins = [10, 50, 100]
quantity = [1, 2, 1]

possibleSums(coins, quantity)

# def possibleSums(coins, quantity)
#   sums = Hash.new(0)
#   coins.each_with_index do |coin, index|
#     quantity[index].times do
#       sums.keys.each { |key| sums[key+coin] += 1 }
#       sums[coin] += 1
#     end
#   end
#   print sums.keys.size
# end
