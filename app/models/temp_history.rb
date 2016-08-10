require 'httparty'

class TempHistory
  def initialize(year, month, day, zip)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast/history_#{year}#{month}#{day}/q/#{zip}.json")
  end

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

  def string_temp
    @response["history"]["dailysummary"][0]["meantempi"]
  end
end
