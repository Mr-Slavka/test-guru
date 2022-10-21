
  class TestPassagesController < ApplicationController

    before_action :set_test_passage, on: %i[show result update]

    def show; end

    def result; end

    def update
      @test_passage.accept!(params[:answer_ids])

      if @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now

        added_badges = BadgesService.new(@test_passage).call
        added_badges.each { |badge| current_user.badges.push(badge) if badge.present? }

        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    end

    private

    def set_test_passage
      @test_passage = TestPassage.find(params[:id])
    end
  end
