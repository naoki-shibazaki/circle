class ApplicationMailer < ActionMailer::Base
  default from:     "circlebook.mailer@gmail.com",
          bcc:      "circlebook.mailer@gmail.com",
          reply_to: "circlebook.mailer@gmail.com"
  layout 'mailer'
end