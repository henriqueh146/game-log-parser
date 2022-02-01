# frozen_string_literal: false

require 'game_parser'

describe GameParser do
  it 'Raise an exception when the file is absent' do
    expect { GameParser.new('absent_file') }.to raise_error
  end

  describe '#first_line' do
    it 'Print the first line from games.log' do
      expect(GameParser.new('spec/fixtures/games-fake.log').first_line).to eql('  0:00 ---------------------------'\
        "---------------------------------\n")
    end
  end

  describe '#log_metadata' do
    it 'Return a json object with the number of lines of a log file' do
      parser = GameParser.new('spec/fixtures/games-fake.log')
      expect(parser.log_metadata).to eql({ '/home/henrique/projects/job-code/game-log-parser/spec/fixtures/games-fake'\
        '.log' => { 'lines' => 31, 'players' => ['Isgalamido', 'Dono da Bola', 'Mocinha'],
                    'kills' => { 'Isgalamido' => 3, 'Dono da Bola' => 0, 'Mocinha' => 0 }, 'total_kills' => 3 } })
    end
  end
end
