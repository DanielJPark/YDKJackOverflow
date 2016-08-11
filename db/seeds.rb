u1 = User.create(id: 1, username: "bob", email: "bob@bob.com", password: "password")
u2 = User.create(id: 2, username: "Joe", email: "joe@joe.com", password: "password")
u3 = User.create(id: 3, username: "Jon", email: "jon@jon.com", password: "password")


q1 = Question.create(id: 1, title: "Why is this the question?", content: "This is the content for question1", user: u1 , category_id: 1, selected_answer_id: nil )
q2 = Question.create(id: 2, title: "Is this Question 2?", content: "This is the content for question2", user: u3, category_id: 1, selected_answer_id: nil )
q3 = Question.create(id: 3, title: "Whereis Question 3?", content: "This is the content for question3", user: u2, category_id: 2, selected_answer_id: nil )

c1 = Category.create(id: 1, title: "Category1" )
c2 = Category.create(id: 2, title: "Category2" )
c3 = Category.create(id: 3, title: "Category3" )

a1 = Answer.create(id: 1, content: "This is Answer1", user: u2, question: q1)
a2 = Answer.create(id: 2, content: "This is Answer2", user: u2, question: q2)
a3 = Answer.create(id: 3, content: "This is Answer3", user: u1, question: q3)


Comment.create(id: 1, content: "This is a comment1", user: u3, post: q1)
Comment.create(id: 2, content: "This is a comment2", user: u1, post: q2)
Comment.create(id: 3, content: "This is a comment3", user: u1, post: a3)
