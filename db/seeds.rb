# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
                      {name: "Jo Bob", email: "jobob@gmail.com", password: "redneck", password_confirmation: "redneck"},
                      {name: "Eddie", email: "eddie@aol.com", password: "nascar", password_confirmation: "nascar"},
                      {name: "Billy", email: "billy@hotmail.com", password: "possum", password_confirmation: "possum"}
                    ])


chat_session_body_one = {
  messages: [
    {
      senderId: users.first.id,
      message: "Hey Jo Bob how's it going"
    },
    {
      senderId: users.second.id,
      message: "Real great Eddy thanks"
    }
  ]
}

chat_session_body_two = {
  messages: [
    {
      senderId: users.first.id,
      message: "How about the weather"
    },
    {
      senderId: users.second.id,
      message: "It's great"
    }
  ]
}

chat_session_body_three = {
  messages: [
    {
      senderId: users.first.id,
      message: "The sports team did great eh?"
    },
    {
      senderId: users.last.id,
      message: "They won the points"
    }
  ]
}

chat_sessions = ChatSession.create([
  {body: chat_session_body_one.to_json, started_at: Time.now, ended_at: Time.now + 1.hour},
  {body: chat_session_body_two.to_json, started_at: Time.now, ended_at: Time.now + 1.hour},
  {body: chat_session_body_three.to_json, started_at: Time.now, ended_at: Time.now + 1.hour},
])

users.each do |user|
  user.chat_sessions << ChatSession.where("body LIKE '%senderId\":#{user.id}%'")
  user.save
end
