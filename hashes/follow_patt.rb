def areFollowingPatterns(strings, patterns)
  match = {}
  outcome = true
  strings.each_with_index do |string, index|
    unless match[string] then match[string] = patterns[index] end

    outcome = false if match[string] != patterns[index]
    break if outcome == false
  end
  outcome = false if match.size != patterns.uniq.size
  outcome
end

strings =
["cat",
 "dog",
 "doggy"]
patterns =
["a",
 "b",
 "b"]

areFollowingPatterns(strings, patterns)
