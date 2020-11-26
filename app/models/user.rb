class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :bullshits, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :name
end
