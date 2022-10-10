
  class TestsController < ApplicationController

    def index
      @tests = Test.all
    end

    def start
      @test = Test.find(params[:id])
      if @test.questions.present?
        current_user.tests.push(@test)
        redirect_to current_user.test_passage(@test)
      else
        flash_options = { alert: t('.no_questions') }
        redirect_to tests_path, flash_options
      end
    end
  end
