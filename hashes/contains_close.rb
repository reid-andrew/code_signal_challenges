# def containsCloseNums(nums, k)
#   contains = false
#   nums = nums.each_with_index.reduce({}) do |accum, (value, index)|
#     accum[index] = value
#     accum
#   end
#   nums.each do |key, value|
#     contains = true if nums.any? do |key_inner, value_inner|
#       value_inner == value && key_inner != key && (key_inner - key).abs <= k
#     end
#     break if contains == true
#   end
#   contains
# end

def containsCloseNums(nums, k)
  nums = nums.each_with_index.reduce({}) do |accum, (value, index)|
    accum[value] = [] if !accum[value]
    accum[value] << index
    accum
  end

  nums.select{ |key, value| value.size > 1 }.any? do |key, value|
    value.each_with_index.any? do |n, i|
      return false unless value[i + 1]
      (n - value[i + 1]).abs <= k
    end
  end
end

nums = [0, 1, 2, 3, 5, 2]
k = 2

containsCloseNums(nums, k)
