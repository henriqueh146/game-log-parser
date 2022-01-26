require_relative 'lib/game_parser'

parser = GameParser.new('games.log')

puts parser.first_line
puts parser.log_metadata
