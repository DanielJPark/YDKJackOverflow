User.delete_all
Question.delete_all
Category.delete_all
Answer.delete_all
Comment.delete_all

u1 = User.create(username: "bob", email: "bob@bob.com", password: "password")
u2 = User.create(username: "Joe", email: "joe@joe.com", password: "password")
u3 = User.create(username: "Jon", email: "jon@jon.com", password: "password")

c1 = Category.create(title: "Jack White" )
c2 = Category.create(title: "Jack Black" )
c3 = Category.create(title: "John F. (\"Jack\") Kennedy")
c4 = Category.create(title: "John F. (\"Jack Jr.\") Kennedy, Jr." )
c5 = Category.create(title: "Jack Sprat" )
c6 = Category.create(title: "Blackjack (card game)" )
c7 = Category.create(title: "Blackjack (weapon)" )
c8 = Category.create(title: "Jack (fast food spokesperson)" )
c9 = Category.create(title: "Blackjack" )
c10 = Category.create(title: "Jack Robinson" )
c11 = Category.create(title: "Jack Johnson (boxer)" )
c12 = Category.create(title: "*-jack (theft)" )

q1 = Question.create(title: "Why is this the question?", content: "This is the content for question1", user: u1 , category: c1)
q2 = Question.create(title: "Is this Question 2?", content: "This is the content for question2", user: u1, category: c1)
q3 = Question.create(title: "Where is Question 3?", content: "This is the content for question3", user: u1, category: c2)

a1 = Answer.create(content: "This is Answer1", user: u2, question: q1)
a2 = Answer.create(content: "This is Answer2", user: u2, question: q2)
a3 = Answer.create(content: "This is Answer3", user: u1, question: q3)
a4 = Answer.create(content: "This is Answer4", user: u1, question: q3)
a5 = Answer.create(content: "This is Answer5", user: u1, question: q3)

Comment.create(content: "This is a comment on QUESTION-1", user: u3, post: q1)
Comment.create(content: "This is a comment on QUESTION-2", user: u1, post: q2)
Comment.create(content: "This is a comment on QUESTION-3", user: u1, post: q3)
Comment.create(content: "This is a comment on ANSWER-1", user: u1, post: a1)
Comment.create(content: "This is a comment on ANSWER-2", user: u1, post: a2)
Comment.create(content: "This is a comment on ANSWER-3", user: u1, post: a3)
Comment.create(content: "This is a comment on ANSWER-4", user: u1, post: a4)
Comment.create(content: "This is a comment on ANSWER-5", user: u1, post: a5)
