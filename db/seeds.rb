

  Category.delete_all
  Test.delete_all
  Question.delete_all
  Answer.delete_all



  #users = User.create([{ name: 'Admin', password_digest: '$2a$12$1o3IGBatw99NCRXSLjYPDeul1bJZpKocSCQcyvNrRQnyiRpoEJw8G',
  #                       admin: true, email: 'email@email.com' },
  # {                     name: 'Admin2', password_digest: '$2a$12$1o3IGBatw99NCRXSLjYPDeul1bJZpKocSCQcyvNrRQnyiRpoEJw8G',
  #                       admin: true, email: 'email@email1.com' },
  #                     { name: 'User', password_digest: '$2a$12$1o3IGBatw99NCRXSLjYPDeul1bJZpKocSCQcyvNrRQnyiRpoEJw8G',
  #                       email: 'email@email2.com' },
  #                     { name: 'User2', password_digest: '$2a$12$1o3IGBatw99NCRXSLjYPDeul1bJZpKocSCQcyvNrRQnyiRpoEJw8G',
  #                       email: 'email@email3.com' }])

  users = [User.first, User.last]
  categories = Category.create([{ title: 'Backend' }, { title: 'Frontend' },
                                { title: 'Mobile app development' }])


  tests = Test.create([{ title: 'Ruby', level: 2, author: users.sample, category_id: categories[0].id },
                       { title: 'PHP', level: 2, author: users.sample, category_id: categories[0].id },
                       { title: 'JavaScript', level: 1, author: users.sample, category_id: categories[1].id }])

  questions = Question.create([{ body: 'Какой метод позволяет привести строку в нижний регистр?', test_id: tests[0].id },
                               { body: 'Какая арифметическая операция приводит к ошибке в javascript?', test_id: tests[2].id },
                               { body: 'В каком варианте вы получите число без пропуска строки от пользователя?', test_id: tests[0].id },
                               { body: 'Как называется самый популярный фреймворк языка Ruby для веба?', test_id: tests[0].id },
                               { body: 'Чем отличается puts от print?', test_id: tests[0].id }])



  Answer.create([{ body: 'upcase()', correct: false, question_id: questions[0].id },
                 { body: 'dcase()', correct: false, question_id: questions[0].id },
                 { body: 'down()', correct: false, question_id: questions[0].id },
                 { body: 'downcase()', correct: true, question_id: questions[0].id },
                 { body: 'Деление на ноль.', correct: false, question_id: questions[1].id },
                 { body: 'Умножение числа на строку.', correct: false, question_id: questions[1].id },
                 { body: 'Корень из отрицательного числа.', correct: false, question_id: questions[1].id },
                 { body: 'Никакая из вышеперечисленных.', correct: true, question_id: questions[1].id },
                 { body: 'num = gets.to_i', correct: false, question_id: questions[2].id },
                 { body: 'num = gets.chomp()', correct: false, question_id: questions[2].id },
                 { body: 'num = chomp().to_i', correct: false, question_id: questions[2].id },
                 { body: 'num = gets', correct: false, question_id: questions[2].id },
                 { body: 'num = gets.chomp().to_i', correct: true, question_id: questions[2].id },
                 { body: 'Rails', correct: false, question_id: questions[3].id },
                 { body: 'Ruby Framework', correct: false, question_id: questions[3].id },
                 { body: 'Ruby Web', correct: false, question_id: questions[3].id },
                 { body: 'Ruby On Rails', correct: true, question_id: questions[3].id },
                 { body: 'Ничем, оба делают одно и тоже', correct: false, question_id: questions[4].id },
                 { body: 'puts без пропуска строки, а print с пропуском', correct: false, question_id: questions[4].id },
                 { body: 'puts позволяет выводить переменные, а print только текст', correct: false, question_id: questions[4].id },
                 { body: 'print без пропуска строки, а puts с пропуском', correct: false, question_id: questions[4].id }])




