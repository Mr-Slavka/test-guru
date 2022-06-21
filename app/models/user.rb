class User < ApplicationRecord

  def tests(level)
    Test.joins('JOIN stories ON tests.id = stories.test_id')
        .where('stories.user_id = :id  AND level =  :level', id: id, level: level)
  end
end
