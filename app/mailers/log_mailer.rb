class LogMailer < ActionMailer::Base
  default from: 'aldo@example.com'

  def log_report(user, beer_logs)
    @user = user
    @beer_logs = beer_logs
    mail(
        to: user.email,
        subject: 'Here is your weekly beer log',
        template_path: "mailers",
        template_name: "log_report"
    )
  end
end