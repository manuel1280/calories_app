class ShareToken < ApplicationRecord
  belongs_to :user
  attr_accessor :token, :expires_at
  before_save :generate_token

  def generate_token
     self.token = SecureRandom.urlsafe_base64 
  end
end
