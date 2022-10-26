class QuestionsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    Question.create(question_params)
    redirect_to action: :index
  end

  def show 
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  private
  def question_params
    params.require(:question).permit(:title, :content, :name).merge(user_id: current_user.id)
  end

end
