# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV.fetch("SENDGRID_USERNAME"),
  :password => ENV.fetch("SENDGRID_PASSWORD"),
  :domain => "#{ENV.fetch("HEROKU_APP_NAME")}.herokuapp.com",
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}