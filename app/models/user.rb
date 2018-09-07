class User < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_secure_password validations: false

  validates :name, presence: true
  validates :email, uniqueness: true, format: /\A[A-Za-z0-9]+@[A-Za-z]+\.[a-z]+\z/
  validates :password, presence: true, confirmation: true
end
