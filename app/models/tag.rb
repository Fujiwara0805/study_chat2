class Tag < ApplicationRecord
  has_many :question_tag_relations
  has_many :questions, through: :question_tag_relations
  validates :tag_name,  uniqueness: true
end
