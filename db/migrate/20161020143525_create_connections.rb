class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.integer :sender_id, index: true, foreign_key: true
      t.integer :recipient_id, index: true, foreign_key: true
      t.integer :initial_id, foreign_key: true
      t.integer :reply_id
      t.timestamps
    end
  end
end
