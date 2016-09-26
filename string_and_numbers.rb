def string_and_numbers
  #getting the input
  string = gets.chomp

  #creating empty hash with default values of 0
  repetition = {}
  repetition.default = 0
  #counting how many times each character occurs in the string
  string.each_char do |c|
    repetition[c] = repetition[c] + 1 
  end

  #sorting the times each character occurs in deacreasing order and saving only the 10 biggest
  #characters that are not in the 10 most occuring are removed form the hash 
  most_occurs = repetition.values.sort {|x,y| y <=> x }.first(10)
  repetition.keep_if { |k,v| v >= most_occurs[9] }
  
  #new hash for representing the encoding
  encoding = {}
  encoding.default = 0
  
  #setting the encoding
  #using the inverted hash for key 
  #the corresponding character is found by the times it occurs in the input string
  repetition_i = repetition.invert
  most_occurs.each_index do |i|
    encoding[repetition_i[most_occurs[i]]] = 9 - i
  end

  #decodng the input string and saving the results in a new one
  decoded = ''
  string.each_char do |c|
    c = encoding[c] if encoding.has_key? c
    decoded << c.to_s
  end

  #calculating the sum of all numbers derived from splitting the decoded string by non-digit characters and 
  numbers = decoded.split(/\D/)
  result = numbers.map { |n| n = n.to_i }.reduce :+
  p result
end

string_and_numbers
