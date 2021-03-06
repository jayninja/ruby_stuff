#!/usr/bin/ruby
#
# writing a port scanner to learn ruby better ;p
#

require 'socket'
require 'getoptlong'


#host, start_port, end_port = ARGV
$verbose = false        # global debug variable
$open_ports_list = []   # global list of open ports in case we need them later.

#defaults
host = "127.0.0.1"
low_port = "1"
high_port = "65535"


opt = GetoptLong.new(
    ['--host', '-i', GetoptLong::REQUIRED_ARGUMENT],
    ['--low', '-l', GetoptLong::REQUIRED_ARGUMENT],
    ['--high', '-h', GetoptLong::REQUIRED_ARGUMENT],
    ['--verbose', '-v', GetoptLong::NO_ARGUMENT],
    ['--help', GetoptLong::NO_ARGUMENT])

opt.each_option do |name,arg|
   case name
     when '--help'
        puts "usage: pscan.rb --host <ip> --low <start_port> --high <end_port>"
        puts "       pscan.rb --host 123.123.123.123 -l 1 -h 1024"
        exit
     when '--verbose'
        $verbose = true 
     when '--host'
        host = arg
        puts "host: #{host}" unless $verbose == false
     when '--low'
        low_port = arg
        puts "low port: #{low_port}" unless $verbose == false
     when '--high'
        high_port = arg    
        puts "high port: #{high_port}" unless $verbose == false
   end
end


def scan_port(host,port)
  begin
    TCPSocket.new(host, port)
  rescue Errno::ECONNREFUSED
    puts "#{host}:#{port} closed" unless $verbose == false
    return false
  end
    puts "#{host}:#{port} open"
    $open_ports_list.push(port)
    return true 
end

def scan_host(host,port_list)
# stole some threading code to make things faster
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

port_list = build_port_list(low_port,high_port)      # returns an array of ports to scan
scan_host(host,port_list)                            # threads out scan_port() TODO: could use some thread limits
puts $open_ports_list
