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
    path = File.expand_path(@file)
    lines = File.readlines(@file).length
    metadata = {path => {"lines" => lines}}
    JSON.pretty_generate(metadata)
  end
end
