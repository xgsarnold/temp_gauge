require 'httparty'

class TempHistory < ActiveRecord::Base
  def initialize(zip)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast/history_#{year}#{month}#{day}/q/#{zip}.json")
  end

  def high_temp
    @response["history"]["dailysummary"]["maxtempi"].to_f
  end

  def low_temp
    @response["history"]["dailysummary"]["mintempi"].to_f
  end

  def mean_temp
    @response["history"]["dailysummary"]["meantempi"].to_f
  end
end
