#!/usr/bin/ruby

require 'open3'

if ARGV.empty? then
  puts "usage: crtime /path/to/file.log"
  exit 1
end

file = ARGV[0]

## I know, but how the hell else am i supposed to do it?
partition = `df -T #{file} | grep dev `

# this is lame too, in order to get the debugfs header to not show
# you have to use open3. Theres no amount of redirecting to do it.
file_inode = File.stat(file).ino
stdout, stderr, status = Open3.capture3("debugfs -R 'stat <#{file_inode}>' #{partition}")

# split it by new lines 
result_split = stdout.split("\n")

# go through each line and find the one with crtime
result_split.each { |local_result|
if ( local_result =~ /crtime(.*)/ )
  puts local_result
  end
}
