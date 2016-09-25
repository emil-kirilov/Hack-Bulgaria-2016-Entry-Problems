def heads_and_tails
  results = gets.chomp.gsub(/\,\s/,"")

  h_streak, h_max_streak = 0, 0 
  t_streak, t_max_streak = 0, 0 
  last_char = ''

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