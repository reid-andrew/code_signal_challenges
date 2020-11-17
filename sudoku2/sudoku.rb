def sudoku2(grid)
  shift_map = {0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0, 9 => 0}
  outcome = iterate_grid(grid, shift_map)
  while outcome[:result] == false && outcome[:iteration] < 9 do
    new_iteration = outcome[:shift_row] == outcome[:failed_row] ? 0 : outcome[:iteration] += 1
    shift_map[outcome[:failed_row]] += 1
    iterate_grid(grid, shift_map, new_iteration, outcome[:failed_row])
  end

  print grid
  print outcome[:result]
end

def iterate_grid(grid, shift_map, iteration = 0, shift_row = 0)
  result = true
  outcome = Hash.new
  grid.each_with_index do |row, row_index|
    available_nums = *(1..9).map(&:to_s)
    used_nums = row.select{ |num| num != "."}
    used_nums.each { |n| available_nums.delete(n) }
    available_nums.rotate!(shift_map[row_index])
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
    outcome = {result: result, failed_row: row_index, iteration: iteration, shift_row: shift_row}
    break if result == false
  end
  outcome
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
