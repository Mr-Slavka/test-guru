
  User.delete_all
  Category.delete_all
  Test.delete_all
  Question.delete_all
  Answer.delete_all
  Story.delete_all


  users = [{ id: 1, name: 'Admin', password: '1', admin: true }, { id: 2, name: 'Admin2', password: '12', admin: true },
             { id: 3, name: 'User', password: '123' }, { id: 4, name: 'User2', password: '1234' }]
  
  users.each do |user_hash|
    User.create(user_hash)
  end
  
  categories = [{ id: 1, title: 'Backend' }, { id: 2, title: 'Frontend' }, { id: 3, title: 'Mobile app development' }]
  
  categories.each do |category_hash|
    Category.create(category_hash)
  end
  
  tests = [{ id: 1, title: 'Ruby', level: 2, user_id: 1, category_id: 1 },
           { id: 2, title: 'PHP', level: 2, user_id: 1, category_id: 1 },
           { id: 3, title: 'JavaScript', level: 1, user_id: 2, category_id: 2 }]
  
  tests.each do |test_hash|
    Test.create(test_hash)
  end

  questions = [{ id: 1, body: 'Какой метод позволяет привести строку в нижний регистр?', test_id: 1 },
               { id: 2, body: 'Какая арифметическая операция приводит к ошибке в javascript?', test_id: 3 }]

  questions.each do |test_hash|
    Question.create(test_hash)
  end

  answers = [{ id: 1, body: 'upcase()', correct: false, question_id: 1 },
             { id: 2, body: 'dcase()', correct: false, question_id: 1 },
             { id: 3, body: 'down()', correct: false, question_id: 1 },
             { id: 4, body: 'downcase()', correct: true, question_id: 1 },
             { id: 5, body: 'Деление на ноль.', correct: false, question_id: 2 },
             { id: 6, body: 'Умножение числа на строку.', correct: false, question_id: 2 },
             { id: 7, body: 'Корень из отрицательного числа.', correct: false, question_id: 2 },
             { id: 8, body: 'Никакая из вышеперечисленных.', correct: true, question_id: 2 }
  ]

  answers.each do |answer_hash|
    Answer.create(answer_hash)
  end

  stories = [{ user_id: 3, test_id: 1 }, { user_id: 4, test_id: 3 }, { user_id: 4, test_id: 2 },
             { user_id: 4, test_id: 1 }]

  stories.each do |story_hash|
    Story.create(story_hash)
  end