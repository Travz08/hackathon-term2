# This is used for our mailer to contact us
class ApplicationMailer < ActionMailer::Base
  default from: 'admin@pawesome.com'
  layout 'mailer'
end
