class ShareGraphsController < ApplicationController
    before_filter :check_token
  
    def check_token
      redirect_to :back, flash: {error: "Bad link"} 
      if current_user.share_token.token.where("token = ? and expires_at > ?", params[:token], Time.now).first.present?
    end
  
    def show
      redirect_to calories_path
    end
  
  end