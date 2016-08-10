class TempAverageController < ApplicationController
  def search
  end

  def result
    daily_average = []
    high_average = []
    low_average = []
    @zip = params[:zip]
    @begin_date = Date.new(params[:temp_history]["begin_date(1i)"].to_i, params[:temp_history]["begin_date(2i)"].to_i, params[:temp_history]["begin_date(3i)"].to_i)
    @end_date = Date.new(params[:temp_history]["end_date(1i)"].to_i, params[:temp_history]["end_date(2i)"].to_i, params[:temp_history]["end_date(3i)"].to_i)
    date_range = (@begin_date..@end_date).to_a
    if date_range.first.nil?
      redirect_to temp_average_search_path, notice: 'Please select select earlier date first.'
      return
    end
    date_range.each do |d|
      temp = TempHistory.new(d.year, ('%02d' % d.month), ('%02d' % d.day), @zip)
      unless temp.errors?
        daily_average << temp.mean_temp.to_f
        high_average << temp.high_temp.to_f
        low_average << temp.low_temp.to_f
      else
        redirect_to temp_average_search_path, notice: 'Please enter a valid zip code.'
        return
      end
    end
    @average_temp = (daily_average.reduce(:+)/daily_average.length).round(1)
    @high = (high_average.reduce(:+)/high_average.length).round(1)
    @low = (low_average.reduce(:+)/low_average.length).round(1)
  end
end
