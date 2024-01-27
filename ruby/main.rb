def draw_board(circles_and_xs)
  circles_and_xs.each do |row|
    puts '-------'
    puts row.join
  end
  puts '-------'
end

def input_move(circles_and_xs, sign)
  puts '縦の位置を入力してください'
  vertical = gets.to_i
  puts '横の位置を入力してください'
  horizontal = gets.to_i
  symbol = sign == 0 ? '○' : '×'
  circles_and_xs[vertical - 1][horizontal * 2 - 1] = symbol
end

def judge(circles_and_xs)
  winning_combinations = [
    [1, 3, 5], [7, 9, 11], [13, 15, 17], # horizontal
    [1, 7, 13], [3, 9, 15], [5, 11, 17], # vertical
    [1, 9, 17], [5, 9, 13] # diagonal
  ]

  winning_combinations.each do |combination|
    row = combination.map { |position| circles_and_xs[position / 6][position % 6] }
    p row
    return '○ wins!' if row.all? { |symbol| symbol == '○' }
    return '× wins!' if row.all? { |symbol| symbol == '×' }
  end

  return 'Draw' if circles_and_xs.flatten.none? { |symbol| symbol == ' ' }

  'Game in progress'
end

circles_and_xs = Array.new(3) { ['|', ' ', '|', ' ', '|', ' ', '|'] }

draw_board(circles_and_xs)
input_move(circles_and_xs, 0)
draw_board(circles_and_xs)
input_move(circles_and_xs, 1)
draw_board(circles_and_xs)
judge(circles_and_xs)