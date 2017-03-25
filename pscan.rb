#!/usr/bin/ruby
#
# writing a port scanner to learn ruby better ;p
#

require 'socket'

host, start_port, end_port = ARGV

def scan_port(host,port)
  begin
    TCPSocket.new(host, port)
  rescue Errno::ECONNREFUSED
    puts "#{host}:#{port} closed"
    return false
  end
    puts "#{host}:#{port} open"
    return true
end

def scan_host(host,port_list)
#  port_list.each do |port|
#    scan_port(host,port)
#  end

# stole some threading code
  threads   = []
  port_list.each { |i| threads << Thread.new { scan_port(host,i) } }
  threads.each(&:join)
end

def build_port_list(low_port,high_port)
  iterator = low_port.to_i
  local_port_list = []
  while iterator <= high_port.to_i do
    local_port_list.push(iterator)
    iterator = iterator + 1
  end
  return local_port_list
end


port_list = build_port_list(start_port,end_port)
scan_host(host,port_list)
