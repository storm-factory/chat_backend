class CreateChatSessionsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_sessions_users do |t|
      t.integer :user_id
      t.integer :chat_session_id
    end
  end
end
