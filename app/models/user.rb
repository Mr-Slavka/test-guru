class User < ApplicationRecord

  def tests(level)
    test_id = Story.where(user_id: id).pluck(:test_id)
    pp Test.where(id: test_id, level: level)
  end
end
