def sudoku2(grid, counter = 1, shift = 0)
  result = true
  orig_grid = grid.clone
  grid.each_with_index do |row, row_index|
    available_nums = *(1..9).map(&:to_s)
    shift.times do
      available_nums.rotate
    end
    used_nums = row.select{ |num| num != "."}
    used_nums.each { |n| available_nums.delete(n) }
    row.each_with_index do |value, column_index|
      break if result == false
      if value == "."
          block = grid[block_values(row_index)].map { |r| r[block_values(column_index)] }.flatten.select{ |val| val != "." }
          column = grid.transpose[column_index].select{ |val| val != "." }
          used = (block + column).uniq
          result = false if available_nums.all?{ |n| used.include?(n) }
          break if result == false
          while used.include?(available_nums.first) do
            available_nums.rotate!
          end

        row[column_index] = available_nums.shift
      end
    end
  end
  if result == false && counter < 9 then
    sudoku2(orig_grid, counter += 1, shift += 1)
  else
    print grid
    print result
  end
end

def block_values(index)
  output = 0..2 if index < 3
  output = 3..5 if index >= 3 && index < 6
  output = 6..8 if index >= 6
  return output
end

grid = [
 [".",".",".","1","4",".",".","2","."],
 [".",".","6",".",".",".",".",".","."],
 [".",".",".",".",".",".",".",".","."],
 [".",".","1",".",".",".",".",".","."],
 [".","6","7",".",".",".",".",".","9"],
 [".",".",".",".",".",".","8","1","."],
 [".","3",".",".",".",".",".",".","6"],
 [".",".",".",".",".","7",".",".","."],
 [".",".",".","5",".",".",".","7","."]]

 sudoku2(grid)
