# Implement a solution in Ruby to the traveling salesman problem using the
# nearest neighbor heuristic.

class City
  attr_accessor :name
  attr_accessor :neighbors
  attr_accessor :visited

  def initialize(name)
    @name = name
    @neighbors = []
  end
end

def nearest_possible_neighbor(current_city)
    neighbor_cities = current_city.neighbors
    closest_city = neighbor_cities[0]

    for current_neighbor in neighbor_cities
      if current_neighbor[1] < closest_city[1]
        closest_city = current_neighbor
      end
    end
  puts closest_city[0].name
end

chicago = City.new("Chicago")
seattle = City.new("Seattle")
los_angeles = City.new("Los Angeles")
ft_lauderdale = City.new("Ft. Lauderdale")
new_york = City.new("New York")

chicago.neighbors = [[seattle, 2100], [los_angeles, 2016], [ft_lauderdale, 1352], [new_york, 790]]
new_york.neighbors = [[chicago, 790], [seattle, 2887], [los_angeles, 2779], [ft_lauderdale, 1257]]
ft_lauderdale.neighbors = [[chicago, 1352], [seattle, 3331], [los_angeles, 2752], [new_york, 1257]]
los_angeles.neighbors = [[chicago, 2016], [seattle, 1135], [ft_lauderdale, 2752], [new_york, 2779]]
seattle.neighbors = [[chicago, 2100], [los_angeles, 1135], [ft_lauderdale, 3331], [new_york, 2887]]

puts nearest_possible_neighbor(chicago) # New York
puts nearest_possible_neighbor(new_york) # Chicago
puts nearest_possible_neighbor(ft_lauderdale) # New York
puts nearest_possible_neighbor(los_angeles) # Seattle
puts nearest_possible_neighbor(seattle) # Los Angeles
