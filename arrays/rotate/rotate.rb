def rotateImage(a)
    cols = a[0].length
    b = []
    cols.times { b << [] }
    row = 0
    cols.times do
      b[row] << a.map { |a_row| a_row[row] }
      row += 1
    end
  b.map { |b_row| b_row.flatten.reverse }
end

def rotateImageAlt(a)
  a.transpose.map(&:reverse)
end

a = [[1,2,3],
 [4,5,6],
 [7,8,9]]

 print rotateImage(a)
 puts '\n'
 print rotateImageAlt(a)
