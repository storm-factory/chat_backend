require 'rails_helper'

RSpec.describe "ChatSessions", type: :request do
  describe "GET /index" do
    it "requires a valid user to be provided" do
      get user_chat_sessions_path("wrong", format: :json)

      assert_response 404
    end

    it "Gets chat sessions for a User and a Peer" do
      user = User.find_by(name: "Jo Bob")
      peer = User.find_by(name: "Eddie")
      get user_chat_sessions_path(user,params: {chat_peers: "#{peer.id}"}, format: :json)

      assert_response 200
      json = JSON.parse(response.body)
      expect(json.has_key? "chat_sessions").to be_truthy
      expect(json["chat_sessions"].length).to eq 2
    end
  end
end
