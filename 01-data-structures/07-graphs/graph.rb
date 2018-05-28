require_relative 'node'

class Graph

  def initialize
    @films_array = []
    @actors_array = []
    # @kevin_bacon = kevin_bacon
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


    # start_node.film_actor_hash.each do |film, actors|
    #   actors.each do |actor|
    #     if actor.name === "Kevin Bacon"
    #       @films_array << film
    #       p @films_array
    #     else
    #       find_kevin_bacon(actor)
    #     end
    #   end
    # end

    # @actors_array << start_node.name
    # p @actors_array

    # @kevin_bacon.film_actor_hash.each do |film, actors|
    #   actors.each do |actor|
    #     if actor.name === start_node.name
    #       @films_array << film
    #       return @films_array
    #     end
    #   end
    # end

    # if @films_array.length >= 5 || start_node.film_actor_hash.nil?
    #   return nil
    # end
    #
    # start_node.film_actor_hash.each do |film, actors|
    #   @films_array << film
    #   p @films_array
    #   actors.each do |actor|
    #     if @actors_array.include?(actor.name)
    #       return nil
    #     else
    #       if actor.name === @kevin_bacon.name
    #         p @films_array
    #       else
    #         find_kevin_bacon(actor)
    #       end
    #     end
    #   end
    # end

    # if start_node.name == "Kevin Bacon"
    #   return @films_array
    # end

    # if start_node.name != "Kevin Bacon"
    #   start_node.film_actor_hash.each do |film, actors|
    #     if actors.include?(kevin_bacon)
    #     actors.each do |actor|
    #       if actor.name == "Kevin Bacon"
    #         @films_array << film
    #         return @films_array
    #       else
    #         @films_array << film
    #         find_kevin_bacon(actor)
    #       end
    #     end
    #   end
    # end
  # end

end
