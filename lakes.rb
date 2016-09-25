def total_liters
  #getting the structure of the lake
  terrain = gets.chomp
  #total amout of liters on the planet
  #depth of the lake
  liters = 0
  depth = 0
  
  #iterating through the structure of the lake
  #every time we go down and the depth is positive (we are below the water level)
  #we increase the liters by 500 (the amount added because we go downwards) and 1000 liters more per depth point
  #every time we move horizontaly 1000 liters per depth point are added (if we are below the water level)
  #every time we go up and the depth is positive we add 1000 lites per depth 
  #but we also need to remove 500 liters as we've moved upwards
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