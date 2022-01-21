require 'game_parser'

describe GameParser do
  it "Raise an exception when the file is absent" do
    expect{
      GameParser.new("absent_file")
    }.to raise_error
  end
  
  describe '#get_first_line' do
    it "Print the first line from games.log" do
      expect{
        puts GameParser.new("spec/fixtures/games-fake.log").get_first_line 
      }.to output("  0:00 ------------------------------------------------------------\n").to_stdout
    end
  end

  describe '#get_log_metadata' do
    it "Return a json object with the number of lines of a log file" do
      file = GameParser.new("spec/fixtures/games-fake.log")
      path, value = JSON.parse("{#{file.get_log_metadata}}").first
      lines, number_of_lines = value.first
      expect(File.exists?(path) && (lines == "lines")).to eql(true)
    end
  end
end




