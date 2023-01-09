require "bundler/inline"
require "json"

gemfile do
    source 'https://rubygems.org'
    gem 'json-schema'
    gem 'json-next'
end

def read_and_parse(filename, schema)
    handle = File.open(filename)
    contents = handle.read
    parsed = HANSON.parse(contents)

    puts JSON::Validator.fully_validate(schema, parsed, :strict => true)
    puts parsed

    handle.close
end

if ARGV.length < 1
    STDERR.puts("No data file is passed")
    exit(1)
end

# read config file
read_and_parse("config.json", "schema/config.schema.json")

# for dataFile in ARGV
#     read_and_parse(dataFile)
# end
