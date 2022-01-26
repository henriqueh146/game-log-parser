require 'json'

# Parse Quake log file and return it in JSON format.
class GameParser
  def initialize(file)
    raise "File doesn't exist" unless File.file?(file)

    @file = file
  end

  def first_line
    File.open(@file, &:readline)
  end

  def log_metadata
    path = file_path
    lines = number_of_lines
    players = players_names
    deaths = deaths players
    metadata = { path => { 'lines' => lines, 'players' => players, 'kills' => deaths,
                           'total_kills' => deaths.values.sum } }
    JSON.pretty_generate(metadata)
  end

  private

  def number_of_lines
    File.readlines(@file).length
  end

  def file_path
    File.expand_path(@file)
  end

  def players_names
    file_lines = File.readlines(@file, chomp: true)
    players = []
    file_lines.each do |line|
      if line.include?('ClientUserinfoChanged')
        player = line[/ n\\([a-zA-Z ]*)\\t/m, 1]
        players.push(player) unless players.include?(player)
      end
    end
    players.compact
  end

  def deaths(players)
    deaths = {}
    players.each { |player| deaths[player] = 0 }
    File.readlines(@file, chomp: true).each do |line|
      if line.include?('Kill')
        killer = line[/(?<=: )([a-zA-Z ]*)(?= killed )/m, 1]
        deaths[killer] = deaths[killer] + 1 if killer
      end
    end
    deaths
  end
end
