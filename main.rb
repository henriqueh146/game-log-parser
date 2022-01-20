require_relative 'lib/game_parser'

puts GameParser.new("games.log").get_first_line
