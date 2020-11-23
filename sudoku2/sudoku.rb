def sudoku2(grid)
  valid = true
  valid = evaluate_rows(grid)
  valid = evaluate_rows(grid.transpose) if valid == true
  valid = evaluate_rows(blocks(grid)) if valid == true

  valid
end

def evaluate_rows(grid)
  valid = true
  grid.each do |row|
    used_nums = row.select{ |num| num != "."}
    valid = false if used_nums.uniq.length != used_nums.length
  end
  valid
end

def blocks(grid)
  blocks = []
  ranges = [0..2, 3..5, 6..8]
  for range in ranges
    rows = []
    range.to_a.each { |r| rows << grid[r] }
    ranges.each do |r|
      block = []
      rows.select { |row| block << row[r] }
      blocks << block.flatten
    end
  end
  blocks
end

grid = [
 [".","4",".",".",".",".",".",".","."],
 [".",".","4",".",".",".",".",".","."],
 [".",".",".","1",".",".","7",".","."],
 [".",".",".",".",".",".",".",".","."],
 [".",".",".","3",".",".",".","6","."],
 [".",".",".",".",".","6",".","9","."],
 [".",".",".",".","1",".",".",".","."],
 [".",".",".",".",".",".","2",".","."],
 [".",".",".","8",".",".",".",".","."]]

 sudoku2(grid)
