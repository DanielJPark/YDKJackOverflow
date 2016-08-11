User.delete_all
Question.delete_all
Category.delete_all
Answer.delete_all
Comment.delete_all

u1 = User.create(username: "bob", email: "bob@bob.com", password: "password")
u2 = User.create(username: "Joe", email: "joe@joe.com", password: "password")
u3 = User.create(username: "Jon", email: "jon@jon.com", password: "password")

c1 = Category.create(title: "Category1" )
c2 = Category.create(title: "Category2" )
c3 = Category.create(title: "Category3" )
c4 = Category.create(title: "Category4" )
c5 = Category.create(title: "Category5" )
c6 = Category.create(title: "Category6" )
c7 = Category.create(title: "Category7" )
c8 = Category.create(title: "Category8" )
c9 = Category.create(title: "Category9" )
c10 = Category.create(title: "Category10" )
c11 = Category.create(title: "Category11" )
c12 = Category.create(title: "Category12" )

q1 = Question.create(title: "Why is this the question?", content: "This is the content for question1", user: u1 , category: c1)
q2 = Question.create(title: "Is this Question 2?", content: "This is the content for question2", user: u3, category: c1)
q3 = Question.create(title: "Whereis Question 3?", content: "This is the content for question3", user: u2, category: c2)



a1 = Answer.create(content: "This is Answer1", user: u2, question: q1)
a2 = Answer.create(content: "This is Answer2", user: u2, question: q2)
a3 = Answer.create(content: "This is Answer3", user: u1, question: q3)


Comment.create(content: "This is a comment1", user: u3, post: q1)
Comment.create(content: "This is a comment2", user: u1, post: q2)
Comment.create(content: "This is a comment3", user: u2, post: a3)
