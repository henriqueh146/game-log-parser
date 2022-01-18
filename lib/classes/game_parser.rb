class GameParser
    def initialize(file)
        @file = file
    end

    def open_file
        raise Exception.new "File doesn't exist" unless File.file?(@file)
        file = File.open(@file)
    end

    def close_file(file)
        file.close
    end

    def print_first_line
        file = open_file
        puts file.read.split(/\n/)[0]
        close_file(file)
    end
end