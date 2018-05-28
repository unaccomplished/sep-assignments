require_relative 'node'

class Graph

  def initialize
    @films_array = []
  end

  def find_kevin_bacon(start_node)
    start_node.film_actor_hash.each do |film, actors|
      actors.each do |actor|
        if actor.name == "Kevin Bacon"
          @films_array << film
          return @films_array
        elsif !@films_array.include?(film)
          @films_array << film
          find_kevin_bacon(actor)
        end
      end
    end

    if @films_array.length <= 6
      return @films_array
    else
      return "#{start_node.name} is not connected to Kevin Bacon within 6 degrees or less."
    end
  end

end
