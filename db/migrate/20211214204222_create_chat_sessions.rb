class CreateChatSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_sessions do |t|
      t.text :body
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
