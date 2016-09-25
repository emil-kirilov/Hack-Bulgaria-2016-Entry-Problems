def total_liters
  depth = 0
  liters = 0
  terrain = gets.chomp
  terrain.each_char do |c|
    case c
    when 'd'
      liters = liters + depth*1000 + 500 if depth >= 0
      depth = depth + 1
    when 'h'
      liters = liters + depth*1000 if depth >= 0
    when 'u'
      liters = liters + depth*1000 - 500 if depth > 0
      depth = depth - 1
    end
  end
  p liters
end

total_liters