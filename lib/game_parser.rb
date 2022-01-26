require 'json'

class GameParser
  def initialize(file)
   raise Exception.new "File doesn't exist" unless File.file?(file)
    @file = file
  end

  def get_first_line
    File.open(@file, &:readline)
  end

  def get_log_metadata
    path = get_file_path
    lines = get_number_of_lines
    players = get_players
    deaths = get_deaths players
    metadata = {path => {"lines" => lines, "players" => players, "kills" => deaths, "total_kills" => deaths.values.sum } }
    JSON.pretty_generate(metadata)
  end

  private

  def get_number_of_lines
    File.readlines(@file).length
  end

  def get_file_path
    File.expand_path(@file)
  end

  def get_players
    file_lines = File.readlines(@file, chomp: true)
    players = []
    file_lines.each { |line|
      if line.include?("Kill")
        killer = line[/(?<=: )([a-zA-Z ]*)(?= killed )/m, 1]
        killed = line[/(?<= killed )([a-zA-Z ]*)(?= by)/m, 1]
        players.push(killer) unless players.include?(killer)
        players.push(killed) unless players.include?(killed)
      elsif line.include?("ClientUserinfoChanged")
        player = line[/ n\\([a-zA-Z ]*)\\t/m, 1]
        players.push(player) unless players.include?(player)
      end
    }
    players.compact
  end

  def get_deaths(players)
    deaths = {}
    players.each{ |player|
      deaths[player] = 0
    }
    File.readlines(@file, chomp: true).each { |line|
      if line.include?("Kill")
        killer = line[/(?<=: )([a-zA-Z ]*)(?= killed )/m, 1]
        deaths[killer] = deaths[killer] + 1 if killer
      end
    }
    deaths
  end
end
