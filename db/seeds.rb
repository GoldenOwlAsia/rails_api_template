user = User.where(email: "admin@example.com").first_or_create!(password: "password", password_confirmation: "password")
user.add_role :admin
