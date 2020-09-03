require_relative 'initializer'

file_path_validator = Validators::FilePath.new(ARGV[0])

unless file_path_validator.valid?
  file_path_validator.errors.each { |error| pp error }

  return
end

parsed_data = Loaders::LogFile.new(ARGV[0]).load

visits = Computes::AllVisits.new(parsed_data).calculate
uniq_views = Computes::UniqueVisits.new(parsed_data).calculate

pp "List of webpages with most page views ordered from most pages views to less page views"
visits.each { |visit| pp "#{visit[0]} #{visit[1]} visits" }

pp "------"

pp "list of webpages with most unique page views ordered from most unique page views to less"
uniq_views.each { |views| pp "#{views[0]} #{views[1]} unique views" }
