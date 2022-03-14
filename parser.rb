#!/usr/bin/env ruby
# frozen_string_literal: true

# warn_indent: true
require 'set'
require 'optparse'
require_relative 'log_parser/error'
require_relative 'log_parser/file_reader'
require_relative 'log_parser/option_extractor'
require_relative 'log_parser/entry'
require_relative 'log_parser/aggregator'
require_relative 'log_parser/accumulator'

# Main class to take file from argv and process it for parsing and returning results
class Parser
  def parse(args)
    file_path = LogParser::OptionExtractor.new(args).file_path
    file_reader = LogParser::FileReader.new(file_path)
    aggregator = LogParser::Aggregator.new(file_reader.lines)
    puts aggregator.sort_and_return_all
    aggregator.sort_and_return_all
  end
end

Parser.new.parse(ARGV) if __FILE__ == $PROGRAM_NAME
