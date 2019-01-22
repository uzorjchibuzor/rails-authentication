class User < ApplicationRecord
 before_create :remember_token  
 has_many :posts 
 has_secure_password

 # Returns a random token.
 def User.new_token
    SecureRandom.urlsafe_base64
  end


 
end
