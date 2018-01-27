class DashboardController < ApplicationController
  def index
    @logs = current_user.beer_logs.where(date: Time.now.beginning_of_week(start_day = :monday)..Date.today)
    @start_date = Time.now.beginning_of_week.strftime('%m/%d/%y')
    @end_date = Time.now.beginning_of_week.strftime('%m/%d/%y')
  end
end
