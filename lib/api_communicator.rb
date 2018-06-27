require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  #Makes film request
  movie_list = []
  character_hash["results"].each do |result|
    if result["name"] == character
      result["films"].each do |url|
        film = RestClient.get(url)
        film_hash = JSON.parse(film)["title"]
        movie_list << film_hash
      end
    end
  end
  movie_list.each_with_index do |movie, index|
    puts "#{index + 1} #{movie}"
  end
end

# def parse_character_movies(films_hash)
#   # some iteration magic and puts out the movies in a nice list
# end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  # parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
