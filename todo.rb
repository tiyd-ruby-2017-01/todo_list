#!/usr/bin/env ruby
require_relative 'command_line_interface'

def main
  command = ARGV[0].sub(/^--/, '')
  argument = ARGV[1..-1].join(' ')

  cli = CommandLineInterface.new
  cli.send(command, argument)
  cli.save
end

main if __FILE__ == $PROGRAM_NAME

