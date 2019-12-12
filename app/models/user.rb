gem 'bcrypt'
class User < ActiveRecord::Base
  has_secure_password


  def password=(new_password)
    self.password_digest = password_confirmation
  end

  # def authenticate(password)
  #   return nil unless dumb_hash(password) == password_digest
  # end

  # private
  #
  # def dumb_hash(input)
  #   input.bytes.reduce(:+)
  # end

end
