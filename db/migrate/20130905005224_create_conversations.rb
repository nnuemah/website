class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :id
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
