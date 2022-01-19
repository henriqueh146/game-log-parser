require 'game_parser'

describe '#print_first_line' do
  it "Print the first line from games.log" do
    expect{
      GameParser.new("games-fake.log").print_first_line 
    }.to output("  0:00 ------------------------------------------------------------\n").to_stdout
  end
end
