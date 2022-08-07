
  User.delete_all
  Category.delete_all
  Test.delete_all
  Question.delete_all
  Answer.delete_all
  Story.delete_all


  users = User.create([{ name: 'Admin', password_digest: '1', admin: true, email: 'email@email.com' },
                       { name: 'Admin2', password_digest: '12', admin: true, email: 'email@email1.com' },
                       { name: 'User', password_digest: '123', email: 'email@email2.com' },
                       { name: 'User2', password_digest: '1234', email: 'email@email3.com' }])


  categories = Category.create([{ title: 'Backend' }, { title: 'Frontend' },
                                { title: 'Mobile app development' }])


  tests = Test.create([{ title: 'Ruby', level: 2, author_id: users[0].id, category_id: categories[0].id },
                       { title: 'PHP', level: 2, author_id: users[0].id, category_id: categories[0].id },
                       { title: 'JavaScript', level: 1, author_id: users[1].id, category_id: categories[1].id }])

  questions = Question.create([{ body: 'Какой метод позволяет привести строку в нижний регистр?', test_id: tests[0].id },
                               { body: 'Какая арифметическая операция приводит к ошибке в javascript?', test_id: tests[2].id }])



  Answer.create([{ body: 'upcase()', correct: false, question_id: questions[0].id },
                 { body: 'dcase()', correct: false, question_id: questions[0].id },
                 { body: 'down()', correct: false, question_id: questions[0].id },
                 { body: 'downcase()', correct: true, question_id: questions[0].id },
                 { body: 'Деление на ноль.', correct: false, question_id: questions[1].id },
                 { body: 'Умножение числа на строку.', correct: false, question_id: questions[1].id },
                 { body: 'Корень из отрицательного числа.', correct: false, question_id: questions[1].id },
                 { body: 'Никакая из вышеперечисленных.', correct: true, question_id: questions[1].id }])




