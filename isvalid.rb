def debug board
  board.each do |row|
    print "| "
    row.each do |cell|
      print "#{cell} | "
    end
    print "\n"
    puts "______________________________________"
  end
end

def is_valid_sudoku board
  row_check = 0
  box_check = 0
  cols_check = [0,0,0,0,0,0,0,0,0]

  board.each_with_index do |row, r|
    row.each_with_index do |cell, c|
      if (c + 2) % 3 == 0 and (r + 2) % 3 == 0 then
        (r-1..r+1).each do |i|
          (c-1..c+1).each do |j|
            box_cell = board[i][j]
            if box_cell == 0 then next end
            if box_check & (1 << box_cell) != 0 then
              puts "cell at (#{i},#{j}) is repeated in the box (value: #{box_cell})"
              return false
            else
              box_check = box_check | (1 << box_cell)
            end
          end
        end
        box_check = 0
      end

      if cell == 0 then
        next
      elsif row_check & (1 << cell) != 0 then
        puts "cell at (#{r},#{c}) is repeated in the row (value: #{cell})"
        #debug board
        return false
      elsif cols_check[c] & (1 << cell) != 0 then
        puts "cell at (#{r},#{c}) is repeated in the column (value: #{cell})"
        #debug board
        return false
      end

      row_check = row_check | (1 << cell)
      cols_check[c] = cols_check[c] | (1 << cell)
    end

    row_check = 0
  end

  return true
end

sudoku_1 = [
  [5, 3, 0, 0, 7, 0, 0, 0, 0],
  [6, 8, 0, 1, 9, 5, 0, 0, 0],
  [0, 9, 8, 0, 0, 0, 0, 6, 0],
  [8, 0, 0, 0, 6, 0, 0, 0, 3],
  [4, 0, 0, 8, 0, 3, 0, 0, 1],
  [7, 0, 0, 0, 2, 0, 0, 0, 6],
  [0, 6, 0, 0, 0, 0, 2, 8, 0],
  [0, 0, 0, 4, 1, 9, 0, 0, 5],
  [0, 0, 0, 0, 8, 0, 0, 7, 9]
]

sudoku_2 = [
  [3, 0, 0, 0, 2, 0, 0, 0, 5],
  [0, 9, 0, 4, 0, 0, 3, 0, 0],
  [0, 0, 6, 3, 0, 0, 0, 0, 0],
  [5, 6, 0, 2, 0, 0, 0, 4, 0],
  [8, 0, 0, 0, 4, 6, 0, 0, 9],
  [0, 0, 9, 1, 0, 7, 0, 0, 3],
  [0, 0, 0, 0, 0, 9, 5, 0, 7],
  [0, 3, 0, 0, 7, 0, 0, 1, 0],
  [6, 9, 0, 0, 1, 0, 0, 0, 4]
]

sudoku_3 = [
  [3, 0, 0, 6, 0, 0, 0, 0, 3],
  [0, 0, 0, 0, 0, 7, 0, 0, 0],
  [0, 0, 9, 0, 3, 0, 0, 8, 0],
  [0, 6, 0, 0, 0, 0, 0, 4, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 4, 0, 0, 0, 0, 0, 5, 0],
  [0, 7, 0, 0, 6, 0, 9, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 7, 0],
  [9, 0, 0, 0, 0, 5, 0, 0, 0]
]

sudoku_4 = [
  [2, 0, 0, 3, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 5, 4, 0],
  [0, 6, 5, 0, 0, 7, 0, 0, 0],
  [0, 0, 6, 0, 9, 0, 0, 8, 0],
  [0, 0, 3, 8, 0, 5, 0, 0, 0],
  [0, 9, 0, 0, 6, 0, 0, 0, 7],
  [0, 0, 0, 9, 5, 0, 0, 3, 0],
  [0, 0, 0, 0, 0, 0, 0, 7, 0],
  [1, 0, 0, 0, 7, 0, 0, 0, 6]
]

sudoku_5 = [
  [0, 0, 0, 1, 0, 0, 9, 0, 0],
  [0, 0, 6, 0, 0, 9, 0, 5, 0],
  [0, 0, 0, 0, 5, 0, 0, 0, 0],
  [0, 9, 0, 0, 0, 0, 0, 0, 8],
  [0, 0, 0, 5, 0, 0, 0, 3, 0],
  [0, 7, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 4, 0, 0, 9],
  [9, 0, 0, 7, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 8, 5,0, 0]
]

if __FILE__ == $0 then
  s1 = "#{is_valid_sudoku(sudoku_1) ? 'valid' : 'not valid'}"
  s2 = "#{is_valid_sudoku(sudoku_2) ? 'valid' : 'not valid'}"
  s3 = "#{is_valid_sudoku(sudoku_3) ? 'valid' : 'not valid'}"
  s4 = "#{is_valid_sudoku(sudoku_4) ? 'valid' : 'not valid'}"
  s5 = "#{is_valid_sudoku(sudoku_5) ? 'valid' : 'not valid'}"

  print "\n"
  puts "sudoku_1 is #{s1}"
  puts "sudoku_2 is #{s2}"
  puts "sudoku_3 is #{s3}"
  puts "sudoku_4 is #{s4}"
  puts "sudoku_5 is #{s5}"
end

