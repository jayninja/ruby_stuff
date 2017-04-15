#!/usr/bin/ruby
#

# Headers
require 'sqlite3'

# Variables
logfile = '/var/log/messages'
sqlitedb = 'syslog.db'

# Create the sqlitedb and table schema if it doesnt already exist.
database = SQLite3::Database.new(sqlitedb)
unless ( File.size(sqlitedb) > 0 ) 
  database.execute <<-SQL
    create table logs( id int, log varchar(255) );
  SQL
end

# loop through and toss it in the sqlitedb
line_num = 0
if File.exist?(logfile) then
   File.open(logfile).each do |line|
     puts "#{line_num += 1 } #{line}"
     database.execute("INSERT INTO logs(id,log) VALUES(?, ?)", [line_num, line])
   end
end

