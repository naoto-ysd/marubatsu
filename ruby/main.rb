def DrawLine(circles_and_xs)
  for num in 1..7
    if num % 2 == 0
      puts '| | | |'
    else
      puts '-------'
    end
  end
end

def Input(vertical, horizontal、sign)
  puts '縦の位置を入力してください'
  verticacl = gets.to_i
  puts '横の位置を入力してください'
  horizontal = gets.to_i
  if sign == 0
    circles_and_xs[vertical][horizontal] = '○'
  else
    circles_and_xs[vertical][horizontal] = '×'
  end
end

circles_and_xs = Array.new(3, ['|',' ','|',' ','|',' ','|'])
DrawLine(circles_and_xs)
InputCircle(vertical, horizontal, 0)
InputCircle(vertical, horizontal, 1)