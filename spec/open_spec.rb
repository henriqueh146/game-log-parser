require 'classes/game_parser'

describe 'GameParser open file exception' do
    it "Raise an exception when the file is absent" do
        expect{
            GameParser.new("absent_file").open_file
    }.to raise_error
    end
end