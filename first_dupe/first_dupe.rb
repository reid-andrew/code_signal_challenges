def firstDuplicate(a)
    x = Hash.new
    a.each_with_index do |value, index|
        if x[value] == nil
            x[value] = {:count => 1, :max_index => index}
        else
            current_count = x[value][:count]
            current_count += 1

            i = current_count > 2 ?  x[value][:max_index] : index
            x[value] = {:count => current_count, :max_index => i}
        end
    end
    return -1 if x.select { |k, v| v[:count] > 1 }.min_by{ |k, v| v[:max_index]}.nil?

    x.select { |k, v| v[:count] > 1 }.min_by{ |k, v| v[:max_index]}[0]
end

a =  [2, 1, 3, 5, 3, 2]
puts firstDuplicate(a)
