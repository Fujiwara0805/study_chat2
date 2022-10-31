class Question < ApplicationRecord
  
  has_many :answers
  has_many :question_tag_relations
  has_many :tags, through: :question_tag_relations
end
