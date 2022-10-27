class Answer < ApplicationRecord
  belongs_to :question

  with_options presence: true do
    validates :name
    validates :content
  end

end
