module Libs
  # Agregate user requests
  class RequestCollection
    attr_reader :data

    def initialize
      @data = {}
      @user_request = Structs::UserRequest.new
    end

    def add_user_request(extracted_line)
      return if extracted_line.strip.empty?

      @user_request.url, @user_request.ip = extracted_line.split(' ')

      add_new_url_and_ip
      increment_visit_for_user_request
    end

    private

    def add_new_url_and_ip
      add_new_url
      add_new_ip
    end

    def add_new_url
      data[@user_request.url] ||= Hash[]
    end

    def add_new_ip
      data[@user_request.url][@user_request.ip] ||= 0
    end

    def increment_visit_for_user_request
      data[@user_request.url][@user_request.ip] += 1
    end
  end
end
