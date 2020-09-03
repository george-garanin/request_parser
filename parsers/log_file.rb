module Parsers
  # Parser for *.log file

  class LogFile
    def initialize(file)
      @file = file
      @request_collection = Libs::RequestCollection.new
    end

    def parse
      read_file

      @request_collection.data
    end

    private

    def read_file
      IO.foreach(@file).each do |line|
        next if line.chomp.empty?

        @request_collection.add_user_request(line)
      end
    end
  end
end
