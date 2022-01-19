class GameParser
  def initialize(file)
   raise Exception.new "File doesn't exist" unless File.file?(@file)
    @file = file
  end

  def print_first_line
    puts File.open(@file, &:readline)
  end
end
