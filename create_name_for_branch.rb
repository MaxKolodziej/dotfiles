#!/usr/bin/env ruby

if ARGV.size == 2
  puts 'git co -b guest-acquisition/' + ARGV[0].to_s.downcase.gsub(' ','-') + '-' + ARGV[1].to_s
else
  puts 'Not enough arguments'
end
