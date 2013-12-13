class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :fname, :lname, :email, :password, :password_confirmation

  before_save :create_remember_token

  has_many :messages
  has_many :letters
  has_many :user_quotes
  has_many :quotes, through: :user_quotes

  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true


  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
