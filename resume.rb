require "json"

def read_and_parse(filename)
    handle = File.open(filename)
    contents = handle.read
    parsed = JSON.parse(contents)

    puts parsed

    handle.close
end

# read config file
if ARGV.length < 1
    STDERR.puts("No data file is passed")
    exit(1)
end

read_and_parse("config.json")

for dataFile in ARGV
    read_and_parse(dataFile)
end
