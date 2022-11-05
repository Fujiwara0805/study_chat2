class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角の英字数字の両方を含めて設定してください'
  
  validates :nickname, presence: true
    
  has_many :questions
  has_many :likes, dependent: :destroy
  has_many :liked_questions, through: :likes, source: :question

  def already_liked?(question)
    self.likes.exists?(question_id: question.id)
  end
end
