def isCryptSolution(crypt, solution)
  values = solution.to_h
  numbers = crypt.map { |word| word.split(//).map { |letter| values[letter] }.join }
  return false if numbers.any? { |number| number[0] == "0" && number.length > 1 }

  return false if numbers[0].to_i + numbers[1].to_i != numbers[2].to_i

  true
end

crypt = ["SEND", "MORE", "MONEY"]
solution =
[["O","0"],
 ["M","1"],
 ["Y","2"],
 ["E","5"],
 ["N","6"],
 ["D","7"],
 ["R","8"],
 ["S","9"]]

 puts isCryptSolution(crypt, solution)
