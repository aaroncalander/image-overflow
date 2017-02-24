Answer.destroy_all
Question.destroy_all
User.destroy_all

users = User.all

users = 5.times.map do
  User.create(username: Faker::Internet.user_name, password_hash: "password")
end

# create questions associated with a user
users.each do |user|
  user.questions.create(img_link: Faker::Internet.url, body: Faker::Hipster.paragraph)
end

questions = Question.all

questions.each do |question|
  question.answers.create(text: Faker::Hipster.sentence, user_id: users.sample.id)
end

answers = Answer.all
