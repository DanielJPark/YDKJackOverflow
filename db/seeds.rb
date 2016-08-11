u1 = User.create(username: "bob", email: "bob@bob.com", password: "password")
u2 = User.create(username: "Joe", email: "joe@joe.com", password: "password")
u3 = User.create(username: "Jon", email: "jon@jon.com", password: "password")

c1 = Category.create(title: "Category1" )
c2 = Category.create(title: "Category2" )
c3 = Category.create(title: "Category3" )

q1 = Question.create(title: "Why is this the question?", content: "This is the content for question1", user: u1 , category: c1, selected_answer_id: nil )
q2 = Question.create(title: "Is this Question 2?", content: "This is the content for question2", user: u3, category: c1, selected_answer_id: nil )
q3 = Question.create(title: "Whereis Question 3?", content: "This is the content for question3", user: u2, category: c2, selected_answer_id: nil )


a1 = Answer.create(content: "This is Answer1", user: u2, question: q1)
a2 = Answer.create(content: "This is Answer2", user: u2, question: q2)
a3 = Answer.create(content: "This is Answer3", user: u1, question: q3)
a3 = Answer.create(content: "This is Answer4", user: u1, question: q3)
a3 = Answer.create(content: "This is Answer5", user: u1, question: q3)



Comment.create(content: "This is a comment on QUESTION-1", user: u3, post: q1)
Comment.create(content: "This is a comment on QUESTION-2", user: u1, post: q2)
Comment.create(content: "This is a comment on QUESTION-3", user: u1, post: q3)
Comment.create(content: "This is a comment on ANSWER1", user: u1, post: a1)
Comment.create(content: "This is a comment on ANSWER2", user: u1, post: a2)
Comment.create(content: "This is a comment on ANSWER3", user: u1, post: a3)
Comment.create(content: "This is a comment on ANSWER4", user: u1, post: a4)
Comment.create(content: "This is a comment on ANSWER5", user: u1, post: a5)
