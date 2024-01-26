def draw_board(circles_and_xs)
  circles_and_xs.each do |row|
    puts row.join
    puts '-------'
  end
end

def input_move(circles_and_xs, sign)
  puts '縦の位置を入力してください'
  vertical = gets.to_i
  puts '横の位置を入力してください'
  horizontal = gets.to_i
  symbol = sign == 0 ? '○' : '×'
  circles_and_xs[vertical][horizontal * 2] = symbol
end

circles_and_xs = Array.new(3) { ['|', ' ', '|', ' ', '|', ' ', '|'] }
draw_board(circles_and_xs)
input_move(circles_and_xs, 0)
draw_board(circles_and_xs)
input_move(circles_and_xs, 1)
draw_board(circles_and_xs)
