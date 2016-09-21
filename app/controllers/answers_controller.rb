class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@answer.question)
      flash[:notice] = 'Answer was successfully created.'
    else
      render :'/questions/show'
      flash[:notice] = 'Answer was not created.'
    end

  end

  private

  def answer_params
    params.require(:answer).permit(:description, :best)
  end

end
