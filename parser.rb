require_relative 'initializer'

file_path_validator = Validators::FilePath.new(ARGV[0])

unless file_path_validator.valid?
  file_path_validator.errors.each { |error| pp error }

  return
end
