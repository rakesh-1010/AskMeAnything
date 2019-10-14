# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
user_emails = [
  "ms.dhoni@oneday.com",
  "steave.smith@test.com",
  "ashish.nehra@test.com",
  "rohit.sharma@test.com",
  "sachin.tendulkar@test.com",
  "rakesh.kumar@t20.com"
]

questions = [
  "What are some of the greatest cricket quotes",
]

answers = {
 "ms.dhoni@oneday.com": "Sham Tak Khelenge to",
 "ashish.nehra@test.com": "Easy catch bhi nhi pakadte sale",
 "rohit.sharma@test.com": "Bhag puji bhag",
 "steave.smith@test.com": "I am cheat",
 "sachin.tendulkar@test.com": "Wear helmet at the back also"
}

User.all.destroy_all
Question.all.destroy_all
Answer.all.destroy_all

user_emails.each do |email|
  User.create!(
    email: email,
    password: 12345678,
    password_confirmation: 12345678
  )
end

questioner = User.find_by(email: "rakesh.kumar@t20.com")
byebug
Question.create!(
  body: questions[0],
  category: "Cricket Trivia",
  user_id: questioner.id
)

answers.each do | key, value |
  answerer = User.find_by(email: key)
  question = Question.last
  Answer.create!(
    body: value,
    user_id: answerer.id,
    question_id: question.id
  )
end
