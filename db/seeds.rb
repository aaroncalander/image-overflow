require 'faker'

Answer.destroy_all
Question.destroy_all
User.destroy_all
Vote.destroy_all

users = User.all

users = 5.times.map do
  User.create(username: Faker::Internet.user_name, password_hash: "password")
end

# create questions associated with a user
users.each do |user|
  user.questions.create(text: Faker::Lorem.sentence)
end

questions = Question.all

questions.each do |question|
  question.answers.create(text: Faker::Lorem.sentence, user_id: users.sample.id)
end

answers = Answer.all

answers.each do |answer|
  answer.votes.create(value: 1)
end
