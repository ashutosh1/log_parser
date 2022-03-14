# frozen_string_literal: true

module LogParser
  # Aggregate all data, sort the results and return desired output
  class Aggregator
    def initialize(lines)
      @lines = lines
    end

    def sort_and_return_all
      total_views = sort_by_total.map { |aggregate| "#{aggregate[0]} #{aggregate[1].total} visits" }
      unique_views = sort_by_unique.map { |aggregate| "#{aggregate[0]} #{aggregate[1].unique.length} unique views" }
      total_views + unique_views
    end

    private

    def sort_by_total
      group.sort_by { |_path, views| -views.total }
    end

    def sort_by_unique
      group.sort_by { |_path, views| -views.unique.length }
    end

    def group
      @lines.each_with_object({}) do |line, hash|
        begin
          entry = LogParser::Entry.new(*line.split)
        rescue ArgumentError
          raise LogParser::Error, 'Please provide proper log file'
        end
        hash[entry.path] ||= LogParser::Accumulator.new
        hash[entry.path].add(entry)
      end
    end
  end
end
