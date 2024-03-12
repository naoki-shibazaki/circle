class ApplicationMailer < ActionMailer::Base
  default from:     "noreply@circle-book.com",
          bcc:      "noreply@circle-book.com",
          reply_to: "noreply@circle-book.com"
  layout 'mailer'
end