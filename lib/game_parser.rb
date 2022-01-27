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
    {path => {"lines" => lines, "players" => players}}
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
    file_lines.flat_map do |line|
      if line.include?("Kill")
        killer = line[/(?<=: )([a-zA-Z ]*)(?= killed )/m, 1]
        killed = line[/(?<= killed )([a-zA-Z ]*)(?= by)/m, 1]
        [killer, killed]
      elsif line.include?("ClientUserinfoChanged")
        player = line[/ n\\([a-zA-Z ]*)\\t/m, 1]
        player
      else
        []
      end
    end.uniq.compact
  end
end
