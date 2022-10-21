
  class BadgesService
    RULES = %i[
      all_tests_passages
      test_first_passage
      all_tests_from_category
    ].freeze

    def initialize(test_passage)
      @test_passage = test_passage
      @user = @test_passage.user
      @test = @test_passage.test
    end

    def call
      badges = []
      RULES.each { |rule| badges.push(giving_badges(rule)) }
      badges
    end

    private

    def giving_badges(rule)
      send(rule)
    end

    def all_tests_passages_
      badge = Badge.find_by(rule: 'all_tests_passages')
      test_passages_ids = TestPassage.where(user_id: @user.id).pluck(:test_id).uniq
      tests_ids = Test.pluck(:id).sort
      badge if test_passages_ids == tests_ids
    end

    def test_first_passage
      badge = Badge.find_by(rule: 'test_first_passage')
      test_passage = TestPassage.where(user: @user, test: @test)
      badge if test_passage.count == 1
    end

    def all_tests_from_category
      badge = Badge.find_by(rule: 'all_tests_from_category', rule_options: @test.category_id)
      tests_ids = Test.where(category_id: @test.category_id).pluck(:id).sort
      test_passages_ids = TestPassage.where(user_id: @user.id, test_id: tests_ids).pluck(:test_id).uniq
      badge if tests_ids == test_passages_ids
    end
  end
