require 'aws/core'
require 'aws/simple_email_service'

class LibraryMailer < ActionMailer::Base
  default from: "atla@viswajyothischools.org"

  def send(email)
  	ses = AWS::SimpleEmailService.new(
          :access_key_id => ENV["AWS_ACCESS_KEY"],
          :secret_access_key => ENV["AWS_SECRET_KEY"])

  	identity = ses.identities.verify(email)
  	if identity.verified?
    	mail(:to => email, :subject => "Verifying your registration with 'the Library'")
    else

    end
  end
end
