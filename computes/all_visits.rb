module Computes
  # Calculate total visits for each page

  class AllVisits
    def initialize(request_list)
      @request_list = request_list
    end

    def calculate
      sorted_total_visits
    end

    private

    def total_visits
      @request_list.keys.each_with_object({}) do |url, result|
        result[url] = @request_list[url].values.sum
      end
    end

    def sorted_total_visits
      total_visits.sort { |current_item, next_item| next_item[1] <=> current_item[1] }
    end
  end
end
