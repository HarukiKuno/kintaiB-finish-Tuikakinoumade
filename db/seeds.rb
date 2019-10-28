User.create!(name:  "管理者",
             email: "email@sample.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)
             
             
User.create!(name:  "上長A",
             email: "serasu123@gmail.com",
             password:              "password",
             password_confirmation: "password",
             superior: true)             
             
User.create!(name:  "上長B",
             email: "serasu1234@gmail.com",
             password:              "password",
             password_confirmation: "password",
             superior: true)
             
             
User.create!(name:  "一般ユーザー",
             email: "serasu12345@gmail.com",
             password:              "password",
             password_confirmation: "password")
             
             
             
             
             

