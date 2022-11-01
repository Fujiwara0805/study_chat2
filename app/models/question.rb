class Question < ApplicationRecord 
  belongs_to :user
  has_many :answers
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
