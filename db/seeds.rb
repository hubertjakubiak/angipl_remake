user_1 = User.create(email: 'user_1@test.com', password: 'password', password_confirmation: 'password' )
user_2 = User.create(email: 'user_2@test.com', password: 'password', password_confirmation: 'password' )

language_1 = Language.create(name: 'English')
language_2 = Language.create(name: 'Polish')

5.times do
  Word.create(content: Faker::Lorem.word, language: language_1, user: user_1)
  Word.create(content: Faker::Lorem.word, language: language_2, user: user_1)
end

5.times do
  Word.create(content: Faker::Lorem.word, language: language_1, user: user_2)
  Word.create(content: Faker::Lorem.word, language: language_2, user: user_2)
end
