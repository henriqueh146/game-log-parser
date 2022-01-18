logs = File.open("games.log")
first_line = logs.read.split(/\n/)[0]
puts first_line
logs.close