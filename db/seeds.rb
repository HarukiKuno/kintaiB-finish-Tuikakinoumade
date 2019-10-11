User.create!(name:  "管理者",
             email: "email@sample.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)
             
             
User.create!(name:  "上長A",
             email: "serasu123@gmail.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)             
             
User.create!(name:  "上長B",
             email: "serasu1234@gmail.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)
             
             
User.create!(name:  "一般ユーザー",
             email: "serasu12345@gmail.com",
             password:              "password",
             password_confirmation: "password")
             
             
             
             
             

59.times do |n|
  name  = Faker::Name.name
  email = "email#{n+1}@sample.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end