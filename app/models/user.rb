class User < ApplicationRecord
  has_secure_password
  before_save :downcase_email, :check_password

  private
  def downcase_email
    self.email = self.email.downcase
  end
  
  def check_password
    self.password_digest == user_params[:password_digest]
end
