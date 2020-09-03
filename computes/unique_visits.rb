module Computes
  # Calculate unique visits for each page
  class UniqueVisits
    def initialize(request_list)
      @request_list = request_list
    end

    def calculate
      sorted_unique_visits
    end

    private

    def unique_visits
      @request_list.keys.each_with_object({}) do |url, result|
        result[url] = @request_list[url].keys.count
      end
    end

    def sorted_unique_visits
      unique_visits.sort { |current_item, next_item| next_item[1] <=> current_item[1] }
    end
  end
end
