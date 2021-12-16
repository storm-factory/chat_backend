require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it "has the ability to have multiple chat sessions" do
    user = User.create({name: "Jo Bob"})

    chat_session_1 = ChatSession.create({body: "Lorem ipsum...", started_at: Time.now, ended_at: Time.now + 1.hour})
    chat_session_2 = ChatSession.create({body: "Lorem ipsum...", started_at: Time.now, ended_at: Time.now + 1.hour})

    user.chat_sessions << chat_session_1
    user.chat_sessions << chat_session_2
    user.save

    expect(user.chat_sessions.length).to eq 2
  end
end
