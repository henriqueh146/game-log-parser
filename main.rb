require 'json'
require_relative 'lib/game_parser'

parser = GameParser.new('games.log')

puts parser.get_first_line
puts JSON.pretty_generate parser.get_log_metadata
