# Implement a solution in Ruby to the traveling salesman problem using the
# nearest neighbor heuristic.

class City
  attr_accessor :name
  attr_accessor :neighbors
  attr_accessor :visited

  def initialize(name)
    @name = name
    @neighbors = []
    # @visited = false
  end
end

def nearest_possible_neighbor(current_city)
  visited_array = []
  # current_city = current_city.dup
  # while current_city.visited == false
  # while !visited_array.include?(current_city.name)
    # check if current_city is in an array
    neighbor_cities = current_city.neighbors
    closest_city = neighbor_cities[0]

    for current_neighbor in neighbor_cities
      if current_neighbor[1] < closest_city[1]
        closest_city = current_neighbor
      end
    end

    # current_city.visited = true
    # add current_city to an array
  #   visited_array << current_city.name
  #   if !visited_array.include?(next_city[0].name)
  #     current_city = graph_of_cities[next_city[0].name]
  #   end
  # end
  puts closest_city[0].name
end

chicago = City.new("Chicago")
seattle = City.new("Seattle")
los_angeles = City.new("Los Angeles")
ft_lauderdale = City.new("Ft. Lauderdale")
new_york = City.new("New York")

# chicago.neighbors = [{city: seattle, distance: 2100}, {city: los_angeles, distance: 2016}, {city: ft_lauderdale, distance: 1352}, {city: new_york, distance: 790}]
# seattle.neighbors = [{city: chicago, distance: 2100}, {city: los_angeles, distance: 1135}, {city: ft_lauderdale, distance: 3331}, {city: new_york, distance: 2887}]
# los_angeles.neighbors = [{city: chicago, distance: 2016}, {city: seattle, distance: 1135}, {city: ft_lauderdale, distance: 2752}, {city: new_york, distance: 2779}]
# ft_lauderdale.neighbors = [{city: chicago, distance: 1352}, {city: seattle, distance: 3331}, {city: los_angeles, distance: 2752}, {city: new_york, distance: 1257}]
# new_york.neighbors = [{city: chicago, distance: 790}, {city: seattle, distance: 2887}, {city: los_angeles, distance: 2779}, {city: ft_lauderdale, distance: 1257}]

chicago.neighbors = [[seattle, 2100], [los_angeles, 2016], [ft_lauderdale, 1352], [new_york, 790]]
new_york.neighbors = [[chicago, 790], [seattle, 2887], [los_angeles, 2779], [ft_lauderdale, 500]]
ft_lauderdale.neighbors = [[chicago, 1352], [seattle, 3331], [los_angeles, 2752], [new_york, 500]]
los_angeles.neighbors = [[chicago, 2016], [seattle, 1135], [ft_lauderdale, 2752], [new_york, 2779]]
seattle.neighbors = [[chicago, 2100], [los_angeles, 1135], [ft_lauderdale, 3331], [new_york, 2887]]

# graph_of_cities = Hash.new
# graph_of_cities["Chicago"] = chicago
# graph_of_cities["Seattle"] = seattle
# graph_of_cities["Los Angeles"] = los_angeles
# graph_of_cities["Ft. Lauderdale"] = ft_lauderdale
# graph_of_cities["New York"] = new_york


puts nearest_possible_neighbor(chicago)
puts nearest_possible_neighbor(new_york)
puts nearest_possible_neighbor(ft_lauderdale)
puts nearest_possible_neighbor(los_angeles)
puts nearest_possible_neighbor(seattle)
