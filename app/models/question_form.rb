class QuestionForm
  include ActiveModel::Model
  attr_accessor :title, :content, :name, :user_id, :id, :created_at, :updated_at, :tag_name

  with_options presence: true do
    validates :name
    validates :content
    validates :title
  end

  def save
    question = Question.create(title: title, content: content, name: name, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    QuestionTagRelation.create(question_id: question.id, tag_id: tag.id)
  end

  def update(params, question)
    question.question_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    question.update(params)
    QuestionTagRelation.create(question_id: question.id, tag_id: tag.id) if tag_name.present?
  end
end