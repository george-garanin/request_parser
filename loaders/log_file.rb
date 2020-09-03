module Loaders
  # Loader log file by using custom parser
  class LogFile
    def initialize(file)
      @file = file
    end

    def load
      return nil unless valid?

      parse_file
    end

    private

    def valid?
      file_exist? && right_extension? ? true : false
    end

    def file_exist?
      @file ? File.exist?(@file) : false
    end

    def right_extension?
      @file.match?(/.log$/)
    end

    def parse_file
      Parsers::LogFile.new(@file).parse
    end
  end
end
