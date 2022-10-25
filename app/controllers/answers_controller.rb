class AnswersController < ApplicationController
  def create
    Answer.create(answer_params)
    redirect_to question_path(params[:question_id])
  end

  private
  def answer_params
    params.require(:answer).permit(:content, :name).merge(question_id: params[:question_id])
  end
end
