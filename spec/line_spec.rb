require 'main'

describe 'main' do
    it "Print the first line from games.log" do
        expect{
            load('main.rb') 
    }.to output("  0:00 ------------------------------------------------------------\n").to_stdout
    end
end