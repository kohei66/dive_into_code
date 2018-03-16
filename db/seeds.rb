100.times do |_n|
  email = Faker::Internet.email
  name = Faker::Internet.name
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
