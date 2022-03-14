# frozen_string_literal: true

module LogParser
  # To open and read lines from log file
  class FileReader
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
      validate_file
    end

    def lines
      read.each.map(&:chomp)
    end

    private

    # Rescue if file does not exist
    def read
      File.open(@file_path, 'r')
    rescue Errno::ENOENT => e
      raise LogParser::Error, e.message
    end

    def validate_file
      raise LogParser::Error, 'Please provide proper log file path' unless @file_path.end_with?('.log')
    end
  end
end
