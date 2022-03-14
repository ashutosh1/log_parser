# frozen_string_literal: true

module LogParser
  # To parse options and get file path from arguments
  class OptionExtractor
    Options = Struct.new(:path)

    def initialize(args)
      @options = Options.new
      raise LogParser::Error, 'Please provide log file' if args.length.zero?

      parse_options(args)
    end

    def file_path
      @options.path
    end

    private

    def parse_options(args)
      OptionParser.new do |opts|
        opts.banner = "Examples: \n./parser.rb file_path\n./parser.rb -f file_path\nruby parser.rb file_path"

        opts.on('-f', '--file=FILE', 'Log file path') { |file_path| @options.path = file_path }

        opts.on('-h', '--help', 'Prints this help') do
          puts opts
          exit
        end
        @options.path = args[0] if @options.path.nil?
      end.parse!
    end
  end
end
