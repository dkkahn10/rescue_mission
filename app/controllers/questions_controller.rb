class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = Answer.where(@question.id == :question_id).order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = 'Question was successfully created.'
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to save question"
      render :new
    end

  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end

end
