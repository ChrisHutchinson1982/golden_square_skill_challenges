require 'date'
require 'json'

class TimeError

  def initialize(requester) # requester is usually Net::HTTP
    @requester = requester
  end
  # Returns difference in seconds between server time
  # and the time on this computer
  def error
    return get_server_time - Time.now
  end

  private

  def get_server_time
    text_response = @requester.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end

require 'net/http'
time_error_1 = TimeError.new(Net::HTTP)
p time_error_1.error
