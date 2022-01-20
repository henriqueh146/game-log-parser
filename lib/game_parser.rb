class GameParser
  def initialize(file)
   raise Exception.new "File doesn't exist" unless File.file?(file)
    @file = file
  end

  def get_first_line
    File.open(@file, &:readline)
  end
end
