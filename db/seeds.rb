# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "kiril", email:"k@d.com", password: "1234")
User.create(name: "kris", email:"k@j.com", password: "1234")
User.create(name: "maggie", email:"m@h.com", password: "1234")
User.create(name: "mace", email:"m@a.com", password: "1234")

Post.create(text_content: "hey, this is kiril", user_id: 1)
Post.create(text_content: "hey, this is kris", user_id: 2)
Post.create(text_content: "hey, this is maggie", user_id: 3)
Post.create(text_content: "hey, this is mace", user_id: 4)
