class GameParser
  def initialize(file)
    @file = file
  end

  def print_first_line
    raise Exception.new "File doesn't exist" unless File.file?(@file)
    puts File.open(@file, &:readline)
  end
end
