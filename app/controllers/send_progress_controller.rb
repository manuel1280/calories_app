class SendProgressController < ApplicationController
    def index 
    end

    def send_email
        somebody = params[:email]
        @token = current_user.share_token.create(expires_at: Time.now + 24.hours)
        ShareMyProgressMailer.send_to_some_email(somebody).deliver_now
        redirect_to(calories_path, notice: 'Graphic shared')
    end
 
end