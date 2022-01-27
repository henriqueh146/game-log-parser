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
      expect(parser.log_metadata).to eql("{\n  \"/home/henrique/projects/job-code/game-log-parser/spec/fixtures/"\
        "games-fake.log\": {\n    \"lines\": 22,\n    \"players\": [\n      \"Isgalamido\",\n      \"Dono da Bola\",\n"\
        "      \"Mocinha\"\n    ],\n    \"kills\": {\n      \"Isgalamido\": 2,\n      \"Dono da Bola\": 0,\n      "\
        "\"Mocinha\": 0\n    },\n    \"total_kills\": 2\n  }\n}")
    end
  end
end
