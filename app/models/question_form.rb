class QuestionForm
  include ActiveModel::Model
  attr_accessor :title, :content, :name, :user_id, :id, :created_at, :updated_at

  with_options presence: true do
    validates :name
    validates :content
    validates :title
  end

  def save
    question = Question.create(title: title, content: content, name: name, user_id: user_id)
  end

  def update(params, question)
    question.update(params)
  end

end