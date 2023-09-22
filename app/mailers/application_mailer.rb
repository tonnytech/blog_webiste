# The ApplicationMailer class is the base class for all mailers in the application.
# It provides common functionality and configuration for sending emails.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
