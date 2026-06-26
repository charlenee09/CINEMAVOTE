class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :destroy

  validates :username, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :role, inclusion: { in: %w[user admin] }
end