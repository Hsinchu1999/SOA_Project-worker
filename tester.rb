require 'sequel'
require_relative 'config/environment'
require_relative 'init.rb'

pref = TravellingSuggestions::Repository::Preferences.db_create(
  1, 11, 12, 21, 22, 31, 32, 41, 42, 51, 52, 61, 62, 71, 72, 81, 82,
  91, 92, 101, 102, 111, 112, 121, 122, 131, 132, 141, 142, 151, 152,
  161, 162
)

pref = TravellingSuggestions::Repository::Preferences.db_create(
  3, 11, 12, 21, 22, 31, 32, 41, 42, 51, 52, 61, 62, 71, 72, 81, 82,
  91, 92, 101, 102, 111, 112, 121, 122, 131, 132, 141, 142, 151, 152,
  161, 162
)

check = TravellingSuggestions::Repository::Preferences.find_attraction_id(1)

puts check
puts check.class

check = TravellingSuggestions::Repository::Preferences.find_all
puts check
puts check.class

check.each do |db_piece|
  puts db_piece.attributes
end

puts 'check Repository::Models'
check = TravellingSuggestions::Repository::Models.load_all

puts check
puts check.class
puts check.instance_variables
# puts check.model
