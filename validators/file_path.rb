module Validators
  # Validate input file_path
  class FilePath
    attr_reader :errors

    def initialize(file_path)
      @file_path = file_path
      @errors = []
    end

    def valid?
      begin
        validate
      rescue StandardError => err
        pp err.message

        return false
      end

      any_errors?
    end

    private

    def validate
      @errors << 'Need to specify the path to the log file' unless file_path_present?
      @errors << 'Log file not exist' unless file_exist?
      @errors << 'Filename have wrong extencion. Should have *.log' unless correct_file_extension?
    end

    def any_errors?
      @errors.empty?
    end

    def file_path_present?
      !@file_path.empty?
    end

    def file_exist?
      File.exist?(@file_path)
    end

    def correct_file_extension?
      @file_path.match?(/.log$/)
    end
  end
end
