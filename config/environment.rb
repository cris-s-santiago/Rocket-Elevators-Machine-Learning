# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.smtp_settings = {
#     :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
#     :password => 'ENV["SENDGRID_API_KEY"]', # This is the secret sendgrid API key which was issued during API key creation
#     :domain => 'localhost',
#     :address => 'smtp.sendgrid.net',
#     :port => 587,
#     :authentication => :plain,
#     :enable_starttls_auto => true
#   }


    # config.action_mailer.perform_deliveries = true
  # config.action_mailer.default_options = { from: '@gmail.com' }
  # config.action_mailer.default_url_options = { host: 'tommycote.com' }
  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #   from: '@gmail.com',
  #   user_name: '@gmail.com',
  #   password: '',
  #   address: 'smtp-relay.sendinblue.com',
  #   domain: 'smtp-relay.sendinblue.com',
  #   port: '587',
  #   authentication: :plain,
  #   enable_starttls_auto: true,
  # }