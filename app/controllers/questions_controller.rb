class QuestionsController < ApplicationController

  before_action :find_test, only: %i[new create index]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def show; end

  def new; end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_questions_path @test
    else
      render plain: @question.inspect
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test_id)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_question_not_found
    render plain: 'Question not found'
  end

end
