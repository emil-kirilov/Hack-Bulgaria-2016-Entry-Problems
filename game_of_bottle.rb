#each bottle instance has knowledge of its coordinates
#and how to calculate the distance to another bottle 
class Bottle
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
  end

  def distance(bottle)
    Math.sqrt((@x-bottle.x)**2 + (@y-bottle.y)**2)
  end
end

#populating the bottles array with bottles initialized by the input
#creating all the permutations possibly from the bottles array
#calculating the route length for all the permutations and selecting the shortest one
def game_of_bottles
  n = gets.chomp
  bottles = []

  i = 0
  while i < n.to_i
    x, y = gets.chomp.split(/\s/)
    bottles[i] = Bottle.new(x, y)
    i = i + 1
  end

  paths = []
  permutations = bottles.permutation.to_a

  permutations.each { |p| paths << calculate(p) }
  min = paths.min
  p min
end

#accumulating the route length by calculating 
#the distance between 2 bottles at a time
def calculate(route)
  dist = 0
  route.each_cons(2) { |points| dist = dist + points[0].distance(points[1])}
  dist
end

game_of_bottles