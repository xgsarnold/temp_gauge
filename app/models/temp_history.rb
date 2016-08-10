require 'httparty'

class TempHistory
  def initialize(year, month, day, zip)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast/history_#{year}#{month}#{day}/q/#{zip}.json")
  end

# This method allows the app to catch invalid zip codes without making
# a different call to another API to check the zip by utilizing the same API
# used for all the other temperature calls.
  def errors?
    if @response["response"]["error"]
      return true
    end
  end

  def high_temp
    @response["history"]["dailysummary"][0]["maxtempi"]
  end

  def low_temp
    @response["history"]["dailysummary"][0]["mintempi"]
  end

  def mean_temp
    @response["history"]["dailysummary"][0]["meantempi"]
  end
end
