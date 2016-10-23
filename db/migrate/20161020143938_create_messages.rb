class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.datetime :read_at
      t.timestamps
    end
  end
end
