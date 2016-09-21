class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.order(created_at: :desc)
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
      flash[:notice] = "Failed to save question"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(question_params)
      flash[:notice] = 'Question was successfully edited.'
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to save question"
      render :edit
    end
  end

  def destroy
    Question.find(params[:id]).destroy

    flash[:notice] = "Question was deleted!"
    redirect_to questions_path
  end



  private

  def question_params
    params.require(:question).permit(:title, :description)
  end

end
