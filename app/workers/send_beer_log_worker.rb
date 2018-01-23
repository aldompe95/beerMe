require 'sidekiq-scheduler'

class SendBeerLogWorker
  include Sidekiq::Worker

  def perform()
    users = User.all
    users.each do |user|
      beer_logs = setBeerLogData(user)
      LogMailer.log_report(user, beer_logs).deliver_later
    end
  end

  private
    def setBeerLogData(user)
      query = user.beer_logs.select("beer_id, SUM(quantity) as quantity")
                  .where(date: Time.now.beginning_of_week(start_day = :monday)..Date.today).group(:beer_id)
      beer_logs = []
      query.each_with_index do |log, index|
        beer_id = log.beer_id
        beer_logs.push({
            'id':       "#{index}",
            'name':     "#{Beer.find(beer_id).name}",
            'quantity': "#{log.quantity}"
        })
      end
      beer_logs
    end

end
