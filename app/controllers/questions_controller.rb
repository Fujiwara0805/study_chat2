class QuestionsController < ApplicationController
  before_action :authenticate_user!,  except: [:index]
  before_action :set_question, only: [:show, :edit, :update]

  def index
    @questions = Question.all
    @questions = Question.all.page(params[:page]).per(7)
  end

  def new
    @question_form = QuestionForm.new
  end

  def create
    @question_form = QuestionForm.new(question_form_params)
    @question_form.user_id = current_user.id
    url = params[:question_form][:youtube_url]
    url = url.last(11)
    @question_form.youtube_url = url
    respond_to do |format|
      if @question_form.valid?
        @question_form.save
        format.html { redirect_to root_path, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question_form }
      else
        format.html { render :new }
        format.json { render json: @question_form.errors, status: :unprocessable_entity }
      end
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
  end

  def update
    @question_form = QuestionForm.new(question_form_params)
    url = params[:question_form][:youtube_url]
    url = url.last(11)
    @question_form.youtube_url = url
    respond_to do |format|
      if @question_form.valid?
        @question_form.update(question_form_params, @question)
        format.html { redirect_to root_path, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question_form }
     else
        format.html { render :edit }
        format.json { render json: @question_form.errors, status: :unprocessable_entity }
     end
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
    @questions = @q.result.page(params[:page]).per(7)
  end
  
  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_form_params
    params.require(:question_form).permit(:title, :content, :name, :image, :video, :youtube_url).merge(user_id: current_user.id)
  end
end
