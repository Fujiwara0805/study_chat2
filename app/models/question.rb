class Question < ApplicationRecord 
  belongs_to :user
  has_many :answers
  has_many :question_tag_relations, dependent: :destroy
  has_many :tags, through: :question_tag_relations
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
