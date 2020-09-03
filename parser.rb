require_relative 'initializer'

file_path_validator = Validators::FilePath.new(ARGV[0])

unless file_path_validator.valid?
  file_path_validator.errors.each { |error| pp error }

  return
end

prepared_data = Loaders::LogFile.new(ARGV[0]).load

visits = Computes::AllVisits.new(prepared_data).calculate
