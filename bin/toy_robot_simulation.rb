#!/usr/bin/env ruby
require_relative '../lib/simulation'
require_relative '../lib/table'
require_relative '../lib/robot'
require_relative '../lib/table_position'
require_relative '../lib/direction'
require 'pry'

command = ''
simulation = Simulation.new
puts 'Enter a Command'
puts 'You must issue a "PLACE X,Y,DIRECTION" command followed by any of the following: "LEFT", "RIGHT", "MOVE", "REPORT", "PLACE X,Y,DIRECTION" '
puts 'Type "exit" to close program'

while command != "exit\n"
  command = $stdin.readline
  simulation.process(command)
end

puts 'Program Terminated. Goodbye.'