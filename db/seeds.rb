puts "🌱 Seeding ..."

# Seed your database here
puts"👥 Creating users ..."
user1=User.create(name:"Brook Lesnar", email:"brooklesnar@email.com", password:"iamlesnar")
user2 = User.create(name:"Jane Doe", email: "janedoe@email.com", password:"iamjane")



puts "✅ Done seeding!"
