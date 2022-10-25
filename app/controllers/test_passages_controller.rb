class TestPassagesController < ApplicationController

  before_action :set_test_passage, on: %i[show result update]
  before_action :check_timer, only: :update

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now

      BadgesService.call(@test_passage)

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def check_timer
    if @test_passage.test.time && @test_passage.overtime?(@test_passage.end_time)
      redirect_to result_test_passage_path(@test_passage)
    end
  end
end
