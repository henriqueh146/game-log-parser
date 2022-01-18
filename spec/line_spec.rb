require 'classes/game_parser'

describe 'main' do
    it "Print the first line from games.log" do
        expect{
            GameParser.new("games.log").print_first_line 
        }.to output("  0:00 ------------------------------------------------------------\n").to_stdout
    end
end
