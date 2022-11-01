class QuestionsController < ApplicationController
  before_action :authenticate_user!,  except: [:index]
  before_action :set_question, only: [:show, :edit, :update]

  def index
    @questions = Question.all
    @questions = Question.all.page(params[:page]).per(6)
  end

  def new
    @question_form = QuestionForm.new
  end

  def create
    @question_form = QuestionForm.new(question_form_params)
    @question_form.user_id = current_user.id
    if @question_form.valid?
      @question_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show 
    @answer = Answer.new
    @answers = @question.answers
    @like = Like.new
  end

  def edit
    question_attributes = @question.attributes
    @question_form = QuestionForm.new(question_attributes)
    @question_form.tag_name = @question.tags.first&.tag_name
  end

  def update
    @question_form = QuestionForm.new(question_form_params)
    if @question_form.valid?
      @question_form.update(question_form_params, @question)
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

  def search
    if params[:q]&.dig(:title)
      squished_keywords = params[:q][:title].squish
      params[:q][:title_cont_any] = squished_keywords.split(" ")
    end
    @q = Question.ransack(params[:q])
    @questions = @q.result
  end
  
  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_form_params
    params.require(:question_form).permit(:title, :content, :name, :tag_name).merge(user_id: current_user.id)
  end
end
