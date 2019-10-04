class ShareMyProgressMailer < ApplicationMailer
    default from: 'sanitec@example.com'

    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_to_some_email(email)
      @url = "http://localhost:3000/calories?token=#{@token.token}"
      mail( to: email, subject: 'see my caloric progress' )
    end

end
