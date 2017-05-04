User.create!(name:  "Shivanjali",
             email: "shivanjali.khare@gmail.com",
             password:              "shivanjali",
             password_confirmation: "shivanjali",
             admin: true)
             
users = User.all
users  = users.first
           