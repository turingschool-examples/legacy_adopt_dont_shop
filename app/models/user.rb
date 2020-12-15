class User < ApplicationRecord
  has_secure_password
  validates :user_name, presence: true, uniqueness: true

  enum role: %w(default admin)

end
