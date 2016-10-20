class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :connection_id, index: true, foreign_key: true
      t.string :content
      t.boolean :is_read
      t.timestamps
    end
  end
end
