# frozen_string_literal: true

module LogParser
  # Accumalte total and unique views aginst path
  class Accumulator
    attr_accessor :total, :unique

    def initialize
      @total = 0
      @unique = Set.new
    end

    def add(entry)
      @total += 1
      @unique.add(entry.ip)
    end
  end
end
