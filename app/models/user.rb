class User < ActiveRecord::Base

  def password=(new_password)
    self.password_digest = dumb_hash(new_password)
  end

  def authenticate(password)
    return nil unless dumb_hash(password) == password_digest
  end

  private

  def dumb_hash(input)
    input.bytes.reduce(:+)
  end

end
