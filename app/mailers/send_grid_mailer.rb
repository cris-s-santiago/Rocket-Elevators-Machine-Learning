class SendGridMailer < ApplicationMailer
    default from: 'nordik.tommy@gmail.com'

    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_signup_email(lead)
        @lead = lead
        mail( :to => @lead.email,
        :subject => 'Thanks for filling our form' )
    end
    
    
end
