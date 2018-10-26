class User < ApplicationRecord
 before_create :remember_token   
 has_secure_password

 # Returns a random token.
 def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
 
end
