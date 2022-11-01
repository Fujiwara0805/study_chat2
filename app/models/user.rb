class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角の英字数字の両方を含めて設定してください'
  
  validates :nickname, presence: true
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name_k, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_k, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :date_of_birth, presence: true

  
  has_many :items
  has_many :questions
  has_many :likes, dependent: :destroy
  has_many :liked_questions, through: :likes, source: :question

  def already_liked?(question)
    self.likes.exists?(question_id: question.id)
  end
end
