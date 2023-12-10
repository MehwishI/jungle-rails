class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 3 }, if: :password_digest_changed?

  def self.authenticate_with_credentials(email, password)
    # Normalize email, e.g., strip and downcase, to handle edge cases
    normalized_email = email.strip.downcase
    # Find user by normalized email
    user = User.find_by_email(normalized_email)
    # If user exists and password matches, return the user, otherwise return nil
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
