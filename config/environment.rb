# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

 ActionMailer::Base.smtp_settings = {
    :user_name => ENV['johan_buitrago'],
    :password => ENV['sanitec1280'],
    :domain => 'herokuapp.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}