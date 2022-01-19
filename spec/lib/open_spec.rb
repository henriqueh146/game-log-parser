require 'game_parser'

describe '#print_first_line' do
  it "Raise an exception when the file is absent" do
    expect{
      GameParser.new("absent_file").print_first_line
    }.to raise_error
  end
end