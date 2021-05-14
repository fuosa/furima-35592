class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, presence: true
  # validates :email, presence: true
  # validates :email, uniqueness: true
  # validates :email, inclusion: { in: %w(@) }
  # # validates :password, presence: true
  # # validates :password, length: { minimum: 6 }
  # # validates :password, format: { with: /\A[a-z0-9]+\z/i }
  # # # validates :password_confirmation, presence: true
  # # # validates :password, confirmation: true

end