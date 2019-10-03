class ShareMyProgressMailer < ApplicationMailer
    default :from => 'sanitec@example.com'

    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_to_some_email(user)
      @user = user
      mail( :to => @user.email,
      :subject => 'see my caloric progress' )
    end
  end
end
