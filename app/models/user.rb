require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  has_many :projects, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { in: 6..22 }

  before_create :generate_encrypted_password

  def valid_password?(password)
    self.encrypted_password == BCrypt::Engine.hash_secret(password, PASSWORD_SALT)
  end

  private

  def generate_encrypted_password
    if password.present?
       self.encrypted_password = BCrypt::Engine.hash_secret password, PASSWORD_SALT
    end
  end
end
