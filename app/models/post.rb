class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :bullshits, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_presence_of :text_content
end
