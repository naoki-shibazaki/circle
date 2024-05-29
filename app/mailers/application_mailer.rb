class ApplicationMailer < ActionMailer::Base
  default from:     "noreply@circle-book.com",
          bcc:      "circlebook.mailer@gmail.com",
          reply_to: "circlebook.mailer@gmail.com"
  layout 'mailer'
end