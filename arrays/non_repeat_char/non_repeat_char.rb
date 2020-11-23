def firstNotRepeatingCharacter(s)
  letters = s.split('')
  non_repeat_char = '_'

  while non_repeat_char == '_' && letters != [] do
    test = letters.shift
    return non_repeat_char = test if !letters.any?(test)

    letters.delete(test) if letters.any?(test)
  end
  non_repeat_char
end

s = "abacabad"
puts firstNotRepeatingCharacter(s)
