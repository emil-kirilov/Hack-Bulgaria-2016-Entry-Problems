def heads_and_tails
  #getting the result from the tosses
  #removing the comas and the whitespaces
  results = gets.chomp.gsub(/\,\s/,"")

  #creating counters
  h_streak, h_max_streak = 0, 0 
  t_streak, t_max_streak = 0, 0 
  last_char = ''

  #iterating through the tosses' results
  #whenever Head or Tails is hit the corresponding streak counter increases
  #the streak counter is compared to the max streak recorded
  #if the current streak is greater, it is recorded
  #whenever a new side of the coin is flipped the other side's counter is set to 0
  #the side that has been flipped is recorded
  results.each_char do |c|   
    case c
    when 'H' 
      h_streak = h_streak + 1
      h_max_streak = h_streak if h_max_streak < h_streak  
      if last_char == 'T'
        t_streak = 0
      end
      last_char = c
    when 'T'
      t_streak = t_streak + 1
      t_max_streak = t_streak if t_max_streak < t_streak 
      if last_char == 'H'
        h_streak = 0
      end
      last_char = c
   end
  end

  #comparing Head's and Tails's max streaks
  winner = h_max_streak <=> t_max_streak 
  case winner
  when 1
    puts "H wins!"
  when 0
    puts "Draw!"
  when -1
    puts "T wins!"
  end
end

heads_and_tails