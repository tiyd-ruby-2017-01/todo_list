#!/usr/bin/env ruby
require_relative 'command_line_interface'

def command
  ARGV[0].sub(/^--/, '')
end

def argument
  ARGV[1..-1].join(' ')
end

def main
  cli = CommandLineInterface.new
  cli.send(command, argument)
  cli.save
end

main if __FILE__ == $PROGRAM_NAME

