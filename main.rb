require_relative 'lib/game_parser'

parser = GameParser.new("games.log")

puts parser.get_first_line
puts parser.get_log_metadata
