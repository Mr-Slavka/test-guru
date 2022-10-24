
  module Rules
    class AllTestsPassages < AllRules
      def match?
        return false unless @test_passage.successful

        test_passages_ids = TestPassage.successful.where(user_id: @user.id).pluck(:test_id).uniq
        tests_ids = Test.where(published: true).pluck(:id).sort
        test_passages_ids == tests_ids
      end
    end
  end
