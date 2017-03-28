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

# go through each line and find the one with crtime. Then make it pretty.
result_split.each { |local_result|
if ( local_result =~ /crtime(.*)/ )
  #"crtime: 0x58d46f77:c0a4685c -- Thu Mar 23 19:59:35 2017"
  local_split = local_result.split("--")
  date = local_split[1]
  puts "crtime: #{file} --#{date}"
end
}
