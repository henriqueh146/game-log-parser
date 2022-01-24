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
    metadata = {path => {"lines" => lines}}
    JSON.pretty_generate(metadata)
  end

  private

  def get_number_of_lines
    File.readlines(@file).length
  end

  def get_file_path
    File.expand_path(@file)
  end

end
