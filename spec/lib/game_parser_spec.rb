require 'game_parser'

describe GameParser do
  it "Raise an exception when the file is absent" do
    expect{
      GameParser.new("absent_file")
    }.to raise_error
  end
end

describe '#get_first_line' do
  it "Print the first line from games.log" do
    expect{
      puts GameParser.new("spec/fixtures/games-fake.log").get_first_line 
    }.to output("  0:00 ------------------------------------------------------------\n").to_stdout
  end
end
