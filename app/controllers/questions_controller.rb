class QuestionsController < ApplicationController
  before_action :authenticate_user!,  except: [:index]

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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to root_path
     else
      render :edit
     end
  end

  def destroy
    if @question = Question.find(params[:id]) 
      @question.destroy
    end 
      redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :name).merge(user_id: current_user.id)
  end

end
