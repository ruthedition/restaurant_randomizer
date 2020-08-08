class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  has_many :restaurants 
  has_many :user_restaurants 
  has_many :restaurants, through: :user_restaurants
  has_secure_password
  
end